
# Load Balancer

resource "azurerm_lb" "lb" {
  name                = "loadbalancer-starbucks"
  location            = "central india"
  resource_group_name = "sharad-rg"

  frontend_ip_configuration {
    name                 = "frontend-ip-configstarbucks"
    public_ip_address_id = data.azurerm_public_ip.pip.id

  }
}
# Backend Pool
resource "azurerm_lb_backend_address_pool" "backendpool" {
  name            = "backend-pool-starbucks"
  loadbalancer_id = azurerm_lb.lb.id
}

# Health Probe
resource "azurerm_lb_probe" "lbprobe" {
  name            = "helathprobe-starbucks"
  port            = 80
  loadbalancer_id = azurerm_lb.lb.id
  protocol = "Tcp"

}


# LB Rule
resource "azurerm_lb_rule" "lbrule" {
  name                           = "loadbalancer-rule-starbucks"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "frontend-ip-configstarbucks"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backendpool.id]
  probe_id                       = azurerm_lb_probe.lbprobe.id
  loadbalancer_id                = azurerm_lb.lb.id

}



