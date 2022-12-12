terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "task2_RG" {
  name     = "task2_RG"
  location = "West Europe"
}

resource "azurerm_virtual_network" "vmn" {
  name                = "vmn"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.task2_RG.location
  resource_group_name = azurerm_resource_group.task2_RG.name
}


resource "azurerm_subnet" "SubnetA" {
  name                 = "SubnetA"
  resource_group_name  = azurerm_resource_group.task2_RG.name
  virtual_network_name = azurerm_virtual_network.vmn.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_availability_set" "availability_set1" {
  name                         = "app-set"
  location                     = azurerm_resource_group.task2_RG.location
  resource_group_name          = azurerm_resource_group.task2_RG.name
  platform_fault_domain_count  = 3
  platform_update_domain_count = 3
  depends_on = [
    azurerm_resource_group.task2_RG
  ]
}

resource "azurerm_network_security_group" "vm_nsg" {
  name                = "vm-nsg"
  location            = azurerm_resource_group.task2_RG.location
  resource_group_name = azurerm_resource_group.task2_RG.name

  security_rule {
    name                       = "Allow_HTTP"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  subnet_id                 = azurerm_subnet.SubnetA.id
  network_security_group_id = azurerm_network_security_group.vm_nsg.id
}
