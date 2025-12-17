data "azurerm_public_ip" "pip" {
    name = "starbucks-loadbalancer-pip"
    resource_group_name = "shrg_starbucks"
}


