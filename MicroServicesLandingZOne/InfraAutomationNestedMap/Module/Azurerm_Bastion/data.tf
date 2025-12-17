data "azurerm_subnet" "bastion_subnet" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "AppGtwVnet-Starbucks"
  resource_group_name  = "sharad-rg"
}

data "azurerm_public_ip" "bastion_pip" {
  name                = "bastion-pip"
  resource_group_name = "sharad-rg"

}
