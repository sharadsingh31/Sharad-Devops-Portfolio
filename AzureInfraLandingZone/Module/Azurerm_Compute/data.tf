data "azurerm_subnet" "subnets" {
  for_each             = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}


# data "azurerm_public_ip" "pip" {
#   for_each            = var.vms
#   name                = each.value.pip_name
#   resource_group_name = each.value.resource_group_name
# }


data "azurerm_key_vault" "kv" {
 
  name                = "dev-shkeyvalut"
  resource_group_name = "dev-shrg-001"
}

data "azurerm_key_vault_secret" "kv_username" {

  name        = "vmadminusername"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "kv_password" {
  name         = "vmadminpassword"
  key_vault_id = data.azurerm_key_vault.kv.id
}
