# ----- Azure MAIN -----


# --- Resource Group ---

# Azure resource group
resource "azurerm_resource_group" "grafana_rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}


# --- Virtual Machine ---

# Azure linux virtual machine
resource "azurerm_linux_virtual_machine" "grafana_vm" {
  name                = "ubuntu"
  resource_group_name = azurerm_resource_group.grafana_rg.name
  location            = azurerm_resource_group.grafana_rg.location
  size                = var.size
  admin_username      = var.admin_username
  user_data           = filebase64(var.user_data)
  network_interface_ids = [
    azurerm_network_interface.vm_ni.id,
  ]

  admin_ssh_key {
    username   = "ubuntu"
    public_key = file(var.public_key)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
}


# --- Network ---

# Azure Network interface
resource "azurerm_network_interface" "vm_ni" {
  name                = "vm_ni"
  location            = azurerm_resource_group.grafana_rg.location
  resource_group_name = azurerm_resource_group.grafana_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.grafana_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

# Azure Public IP
resource "azurerm_public_ip" "public_ip" {
  name                = "Grafana_IP"
  location            = azurerm_resource_group.grafana_rg.location
  resource_group_name = azurerm_resource_group.grafana_rg.name
  allocation_method   = "Static"
}

# Azure Virtual Network
resource "azurerm_virtual_network" "vm_vn" {
  name                = "vm_vn"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.grafana_rg.location
  resource_group_name = azurerm_resource_group.grafana_rg.name
}

# Azure Subnet
resource "azurerm_subnet" "grafana_subnet" {
  name                 = "grafana_subnet"
  resource_group_name  = azurerm_resource_group.grafana_rg.name
  virtual_network_name = azurerm_virtual_network.vm_vn.name
  address_prefixes     = ["10.0.2.0/24"]
}


# --- Security Group ---

# Azure Security Group
resource "azurerm_network_security_group" "vm_sg" {
  name                = "grafana_sg"
  location            = azurerm_resource_group.grafana_rg.location
  resource_group_name = azurerm_resource_group.grafana_rg.name

  security_rule {
    name                       = "Allow_Grafana"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
