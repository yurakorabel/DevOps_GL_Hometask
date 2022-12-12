resource "azurerm_network_interface" "vm1_ni" {
  name                = "vm1_ni"
  location            = azurerm_resource_group.task2_RG.location
  resource_group_name = azurerm_resource_group.task2_RG.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.SubnetA.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm1" {
  name                = "vm1"
  resource_group_name = azurerm_resource_group.task2_RG.name
  location            = azurerm_resource_group.task2_RG.location
  size                = "Standard_B1s"
  admin_username      = "VM1"
  user_data           = filebase64(var.userdata_file)
  availability_set_id = azurerm_availability_set.availability_set1.id
  network_interface_ids = [
    azurerm_network_interface.vm1_ni.id,
  ]

  admin_ssh_key {
    username   = "VM1"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
}
