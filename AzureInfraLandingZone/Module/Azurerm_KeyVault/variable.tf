variable "keyvault" {
  type = map(object({

    name                        = string
    resource_group_name         = string
    location                    = string
    enabled_for_disk_encryption = bool
    soft_delete_retention_days = number
    purge_protection_enabled   = bool
    sku_name                   = string
    tags                       = map(string)
    


    access_policy = object({

      key_permissions = list(string)

      secret_permissions = list(string)

      storage_permissions = list(string)

      certificate_permissions = list(string)
    })

    network_acls = object({
      bypass         = string
      default_action = string

    })

    })
  )
}