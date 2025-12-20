data "azurerm_network_interface" "nic" {
  name                = var.nic_name
  resource_group_name = "sharad-rg"
}


data "azurerm_lb_backend_address_pool" "backendpool" {
  name            = "backend-pool-starbucks"
  loadbalancer_id = data.azurerm_lb.lb.id
}

data "azurerm_lb" "lb" {
  name                = "loadbalancer-starbucks"
  resource_group_name = "sharad-rg"
}