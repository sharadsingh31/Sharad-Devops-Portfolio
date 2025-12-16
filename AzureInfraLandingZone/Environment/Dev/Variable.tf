variable "rgdetails" {

  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
    }
  ))
}

variable "storage_account" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    }
  ))
}

variable "vnet" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    dns_servers         = optional(list(string))
    ip_address_pool     = optional(list(string))

    subnet = optional(list(object({
      name             = string
      address_prefixes = list(string)
    })))


  }))
  default = {}
}


variable "pip" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    zones               = optional(list(string))
    })
  )

}

variable "azureacr" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = string
    admin_enabled       = bool

    }
  ))

}

variable "aksdetails" {
  type = map(object({

    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = string

    default_node_pool = object({
      name       = string
      node_count = number
      vm_size    = string
      }
    )
    identity = map(object({
      type = string
      })
    )
    tags = optional(map(string))

    }
  ))
}

variable "keyvault" {
  type = map(object({

    name                        = string
    resource_group_name         = string
    location                    = string
    enabled_for_disk_encryption = bool
    soft_delete_retention_days  = number
    purge_protection_enabled    = bool
    sku_name                    = string

    tags = map(string)

   

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

variable "vms" {
  type = map(object({
    vm_name              = string
    resource_group_name  = string
    location             = string
    size                 = string
    subnet_name          = string
    nic_name             = string
    virtual_network_name = string
    pip_name             = string
    caching              = string
    storage_account_type = string
    publisher            = string
    offer                = string
    sku                  = string
    version              = string
    tags                 = map(string)




    ip_configuration = map(object({
      name = string
      # subnet_id                     = optional(string) #if use data block so no need to decalre variable if you use variable then tf.vars need declare value & get error during apply
      # private_ip_address_allocation = optional(string)
      # public_ip_address_id          = optional(string)
    }))
  }))

}

variable "sqlserver" {
  type = map(object({

    name                = string
    resource_group_name = string
    location            = string
    version             = string
    minimum_tls_version = string
    tags                = optional(map(string))
    identityname        = string



    identity = optional(map(object({

      type = string

      }
      ))
    )

    }
    )
  )
}


variable "sqldb" {
  type = map(object({
    name                = string
    server_name         = string
    resource_group_name = string
    collation           = string
    license_type        = string
    max_size_gb         = number
    sku_name            = string
    enclave_type        = string

  }))
}
