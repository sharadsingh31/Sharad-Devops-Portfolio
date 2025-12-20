rgdetails = {
  rg1 = {
    name       = "dev-shrg-001"
    location   = "Central India"
    managed_by = "dev-team"
    tags = {
      environment = "development"
      project     = "project-alpha"
    }
  }
  rg2 = {
    name       = "dev-shrg-002"
    location   = "West US"
    managed_by = "dev-team"

  }
}

storage_account = {
  stg1 = {
    name                     = "devshstorageacct001"
    resource_group_name      = "dev-shrg-001"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "LRS"

  }
}

pip = {
  frontend_vm = {
    name                = "dev-frontendvm-pip-001"
    resource_group_name = "dev-shrg-001"
    location            = "Central India"
    allocation_method   = "Static"
    zones               = ["1", "2"]
  }



}

vnet = {
  vnet1 = {
    name                = "vnet1"
    location            = "Central India"
    resource_group_name = "dev-shrg-001"
    address_space       = ["10.0.0.0/16"]
    ip_address_pool     = null


    subnet = [

      {
        name             = "vm-subnet"
        address_prefixes = ["10.0.1.0/24"]
      },
      {
        name             = "AzureBastionSubnet"
        address_prefixes = ["10.0.2.0/24"]
      }

    ]
  }
}

bastion = {
  bastion1 = {
    name                  = "dev-sh-bastion-001"
    location               = "Central India"
    resource_group_name    = "dev-shrg-001"
    virtual_network_name   = "vnet1"
    subnet_name            = "AzureBastionSubnet"

    ip_configuration = {
      ip1 = {
        name = "bastion-ipconfig1"
      }
    }
    
  }
}

azureacr = {
  acr1 = {
    name                = "Devshacr"
    resource_group_name = "dev-shrg-001"
    location            = "Central India"
    sku                 = "Premium"
    admin_enabled       = false
  }

}

aksdetails = {
  aks1 = {
    name                = "dev-shaks-001"
    location            = "Central India"
    resource_group_name = "dev-shrg-001"
    dns_prefix          = "devshaks001"
    default_node_pool = {
      name       = "default"
      node_count = 1
      vm_size    = "Standard_B2s"
    }
    identity = {
      identity1 = {
        type = "SystemAssigned"
      }
    }

    tags = {
      environment = "dev"
      project     = "project-alpha"
    }
  }
}
keyvault = {
  kv1 = {

    name                = "dev-shkeyvalut"
    resource_group_name = "dev-shrg-001"

    location                    = "Central India"
    enabled_for_disk_encryption = false

    soft_delete_retention_days = 7
    purge_protection_enabled   = false
    sku_name                   = "standard"

    access_policy = {

      key_permissions = ["Get", "List", "Create", "Delete", "Update", "GetRotationPolicy", "SetRotationPolicy"]

      secret_permissions = ["Get", "List", "Set", "Delete"]

      storage_permissions = ["Get", "List", "Set", "Delete"]

      certificate_permissions = ["Get", "List", "Create", "Delete", "Update"]

    }

    network_acls = {
      bypass         = "None"
      default_action = "Allow"

    }
    tags = {
      enviornment = "Dev"
      project     = "project-alpha"
    }
  }


}

vms = {
  frontend_vm = {
    vm_name              = "dev-frontendvm-001"
    resource_group_name  = "dev-shrg-001"
    location             = "Central India"
    size                 = "Standard_B1s"
    nic_name             = "dev-frontendvm-nic-001"
    subnet_name          = "vm-subnet"
    virtual_network_name = "vnet1"
    pip_name             = "dev-frontendvm-pip-001"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
    tags = {
      environment = "Dev"
      project     = "project-alpha"
    }

    ip_configuration = {
      ip1 = {
        name = "ipconfig1"

      }}}}


sqlserver = {
  sqlserver1 = {
    name                = "dev-sqlserver-001"
    resource_group_name = "dev-shrg-001"
    location            = "Central India"
    identityname        = "dev-sql-identity-001"
    version             = "12.0"
    minimum_tls_version = "1.2"
    identityname        = "dev-sql-identity-001"
    identity = {
      identity1 = {
        type = "UserAssigned"
      }
    }
    tags = {
      environment = "Dev"
      project     = "project-alpha"
    }

  }
}

sqldb = {
  sqldb1 = {
    name                = "dev-sqldb-001"
    server_name         = "dev-sqlserver-001"
    resource_group_name = "dev-shrg-001"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "BasePrice"
    max_size_gb         = 10
    sku_name            = "S0"
    enclave_type        = "Default"

  }
}
