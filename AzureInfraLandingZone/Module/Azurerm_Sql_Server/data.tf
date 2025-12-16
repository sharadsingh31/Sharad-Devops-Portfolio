data "azurerm_key_vault" "kv" {
 
  name                = "dev-shkeyvalut"
  resource_group_name = "dev-shrg-001"
}

data "azurerm_key_vault_secret" "SQLusername" {

  name        = "sqladminuser"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "Sqlpassword" {

  name         = "sqladminpassword2"
  key_vault_id = data.azurerm_key_vault.kv.id
}


