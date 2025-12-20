dev_resource_group = {
  rg = {
    name     = "sharad-rg"
    location = "Central India"
  }
}

dev_storage_account = {
  stg = {
    name                     = "sharadstorage778"
    resource_group_name      = "sharad-rg"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}


dev_virtual_network = {
  Vnet = {
    name                = "AppGtwVnet-Starbucks"
    location            = "Central India"
    resource_group_name = "sharad-rg"
    address_space       = ["10.0.0.0/16"]
  }
}
dev_subnet = {
  frontendsubnet = {
    name                 = "Vmsubnet-Starbucks"
    resource_group_name  = "sharad-rg"
    virtual_network_name = "AppGtwVnet-Starbucks"
    address_prefixes     = ["10.0.1.0/24"]

  }

  AppGtwsubnet = {
    name                 = "AppGtwSubnet-Starbucks"
    resource_group_name  = "sharad-rg"
    virtual_network_name = "AppGtwVnet-Starbucks"
    address_prefixes     = ["10.0.3.0/24"]

  }
  # bastionsubnet = {
  #   name                 = "AzureBastionSubnet"
  #   resource_group_name  = "sharad-rg"
  #   virtual_network_name = "AppGtwVnet-Starbucks"
  #   address_prefixes     = ["10.0.2.0/27"]
  # }

  # backendsubnet = {
  #   name                 = "devinfra_backendsubnet"
  #   resource_group_name  = "devinfra_rg1"
  #   virtual_network_name = "devinfra_vnet1"
  #   address_prefixes     = ["10.0.2.0/24"]
  # }
}

dev_public_ip = {
  frontend-pip = {
    public_ip_name      = "starbucks-loadbalancer-pip"
    location            = "Central India"
    resource_group_name = "sharad-rg"
  }

  # Bastion-pip = {
  #   public_ip_name      = "bastion-pip"
  #   location            = "Central India"
  #   resource_group_name = "sharad-rg"
  # }
  # backend-pip = {
  #   public_ip_name      = "backend-pip"
  #   location            = "Central India"
  #   resource_group_name = "devinfra_rg1"
  # }
}

dev_vm_configs = {

  frontendvm1 = {
    vm_name              = "sh-vmstarbucks01"
    nic_name             = "nic-frontend1"
    location             = "Central India"
    resource_group_name  = "sharad-rg"
    size                 = "Standard_B1s"
    admin_username       = "adminazure123"
    admin_password       = "Passwordazure@123"
    subnet_name          = "Vmsubnet-Starbucks"
    virtual_network_name = "AppGtwVnet-Starbucks"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
    nsg_name             = "nsg-frontend1"
  }
  # frontendvm2 = {
  #   vm_name              = "sh-vmstarbucks02"
  #   nic_name             = "nic-frontend2"
  #   location             = "Central India"
  #   resource_group_name  = "sharad-rg"
  #   size                 = "Standard_B1s"
  #   admin_username       = "adminazure123"
  #   admin_password       = "Passwordazure@123"
  #   subnet_name          = "Vmsubnet-Starbucks"
  #   virtual_network_name = "AppGtwVnet-Starbucks"
  #   publisher            = "Canonical"
  #   offer                = "0001-com-ubuntu-server-focal"
  #   sku                  = "20_04-lts"
  #   version              = "latest"
  #   nsg_name             = "nsg-frontend2"
  # }

}


dev_mssql_server = {
  mssql_server1 = {
    name                         = "devsqlserverinfra"
    resource_group_name          = "devinfra_rg1"
    location                     = "Central India"
    version                      = "12.0"
    administrator_login          = "Sqladmin123"
    administrator_login_password = "Sqladmin@123"

  }
}

dev_mssql_database = {
  mssql_database1 = {
    name                = "devinfra-sqldb"
    server_name         = "devsqlserverinfra"
    resource_group_name = "devinfra_rg1"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "LicenseIncluded"
    max_size_gb         = 2
    sku_name            = "S0"
  }

}
