resource "azurerm_mssql_server" "sqlserver" {
  for_each                     = var.sqlserver
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = data.azurerm_key_vault_secret.SQLusername.value
  administrator_login_password = data.azurerm_key_vault_secret.Sqlpassword.value
  minimum_tls_version          = each.value.minimum_tls_version
  tags                         = each.value.tags

  azuread_administrator {

    login_username = azurerm_user_assigned_identity.identity[each.key].name
    object_id      = azurerm_user_assigned_identity.identity[each.key].principal_id
  }


  dynamic "identity" {
    for_each = each.value.identity
    content {
      type         = identity.value.type
      identity_ids = [azurerm_user_assigned_identity.identity[each.key].id]
    }
  }

}



resource "azurerm_user_assigned_identity" "identity" {
  for_each            = var.sqlserver
  name                = each.value.identityname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}

