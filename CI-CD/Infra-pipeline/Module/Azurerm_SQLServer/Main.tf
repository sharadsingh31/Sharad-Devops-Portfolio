resource "azurerm_mssql_server" "sqlserver" {
  for_each                     = var.mssql_server
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.administrator_login          #data.azurerm_key_vault_secret.sqladminuser[each.key].value
  administrator_login_password = each.value.administrator_login_password #data.azurerm_key_vault_secret.sqladminpassword[each.key].value

}

