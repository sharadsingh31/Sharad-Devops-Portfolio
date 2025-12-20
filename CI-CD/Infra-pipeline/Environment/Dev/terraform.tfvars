resource_grp = {
  rg1 = {
    name       = "dev-rg1"
    location   = "East US"
    managed_by = "dev-sharadteam"
    tgas = {
      environment = "development"
      owner       = "sharad"
  } }
}

storage_account = {
stg1 = {
    name                     = "devstoraget1234env"
    resource_group_name      = "dev-rg1"
    location                 = "East US"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    tags = {
      environment = "development"
      owner       = "sharad"
    }
  }

}
