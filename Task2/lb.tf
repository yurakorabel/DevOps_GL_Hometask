resource "azurerm_public_ip" "LB_ip" {
  name                = "LB_ip"
  location            = azurerm_resource_group.task2_RG.location
  resource_group_name = azurerm_resource_group.task2_RG.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "lb1" {
  name                = "lb1"
  location            = azurerm_resource_group.task2_RG.location
  resource_group_name = azurerm_resource_group.task2_RG.name

  frontend_ip_configuration {
    name                 = "LB_ip"
    public_ip_address_id = azurerm_public_ip.LB_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "lb_bp" {
  loadbalancer_id = azurerm_lb.lb1.id
  name            = "BackEndAddressPool"
  depends_on = [
    azurerm_lb.lb1,
    azurerm_availability_set.availability_set1
  ]
}

resource "azurerm_network_interface_backend_address_pool_association" "bp-association1" {
  network_interface_id    = azurerm_network_interface.vm1_ni.id
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_bp.id
}

resource "azurerm_network_interface_backend_address_pool_association" "bp-association2" {
  network_interface_id    = azurerm_network_interface.vm2_ni.id
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_bp.id
}

resource "azurerm_lb_probe" "LB_prob" {
  loadbalancer_id     = azurerm_lb.lb1.id
  name                = "LB_prob"
  protocol            = "Http"
  port                = 80
  request_path        = "/"
  interval_in_seconds = 5
}

resource "azurerm_lb_rule" "LB_Rule" {
  loadbalancer_id                = azurerm_lb.lb1.id
  name                           = "LB_Rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "LB_ip"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lb_bp.id]
  probe_id                       = azurerm_lb_probe.LB_prob.id
}
