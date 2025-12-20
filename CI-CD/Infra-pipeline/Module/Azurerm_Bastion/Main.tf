resource "azurerm_bastion_host" "bastion" {
    name = "shvnet_starbucks-bastion"
    location = "East US 2"
    resource_group_name = "sharad-rg"

    ip_configuration {
        name = "configuration"
        subnet_id = data.azurerm_subnet.bastion_subnet.id
        public_ip_address_id = data.azurerm_public_ip.bastion_pip.id
    }
}

