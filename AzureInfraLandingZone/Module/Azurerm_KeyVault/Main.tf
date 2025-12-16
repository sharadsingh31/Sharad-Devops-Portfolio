resource "azurerm_key_vault" "kv" {
  for_each                    = var.keyvault
  name                        = each.value.name
  resource_group_name         = each.value.resource_group_name
  location                    = each.value.location
  enabled_for_disk_encryption = each.value.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = each.value.soft_delete_retention_days
  purge_protection_enabled    = each.value.purge_protection_enabled
  sku_name = each.value.sku_name
  tags = each.value.tags

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = each.value.access_policy.key_permissions

    secret_permissions = each.value.access_policy.secret_permissions

    storage_permissions = each.value.access_policy.storage_permissions

    certificate_permissions = each.value.access_policy.certificate_permissions
  }

  network_acls {
    bypass         = each.value.network_acls.bypass
    default_action = each.value.network_acls.default_action

  }

}

