resource_grp = {
  rg1 = {
    name       = "QA-rg"
    location   = "East US"
    managed_by = "QA-sharadteam"
    tgas = {
      environment = "Quality Assurance"
      owner       = "sharad"
  } }
}

storage_account = {
stg1 = {
    name                     = "qastorageacct12345"
    resource_group_name      = "QA-rg"
    location                 = "East US"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    tags = {
      environment = "Quality Assurance"
      owner       = "sharad"
    }
  }

}
