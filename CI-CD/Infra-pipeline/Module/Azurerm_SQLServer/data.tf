data "azurerm_key_vault" "keyvault" {
    name = "abtijori"
    resource_group_name = "rg-keyvault"
}



data "azurerm_key_vault_secret" "sqladminuser" {
  for_each     = var.mssql_server
  name         = each.value.sqlusername
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

data "azurerm_key_vault_secret" "sqladminpassword" {
  for_each     = var.mssql_server
  name         = each.value.sqluserpassword
  key_vault_id = data.azurerm_key_vault.keyvault.id
}
