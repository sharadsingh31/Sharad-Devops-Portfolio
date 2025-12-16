module "rg" {
  source    = "../../Module/Azurerm_Resource_group"
  rgdetails = var.rgdetails
}

# module "stg" {
#   source          = "../../Module/Azurerm_Storage_account"
#   depends_on = [ module.rg ]
#   storage_account = var.storage_account

# }

module "pip" {
  source = "../../Module/Azurerm_Public_ip"
  depends_on = [ module.rg ]
  pip    = var.pip

}

module "vnet" {
  source = "../../Module/Azurerm_Networks"
  vnet   = var.vnet

}


# module "ACR" {
#   source     = "../../Module/Azurerm_ACR"
#   depends_on = [module.rg]
#   azureacr   = var.azureacr

# }

# module "AKS" {
#   source     = "../../Module/Azurerm_AKS"
#   depends_on = [module.rg]
#   aksdetails = var.aksdetails

# }

module "keyvault" {
  source     = "../../Module/Azurerm_KeyVault"
  depends_on = [module.rg]
  keyvault   = var.keyvault
}


module "vm" {
  source     = "../../Module/Azurerm_Compute"
  depends_on = [module.rg, module.vnet, module.keyvault, module.pip]
  vms        = var.vms
  pip_id = module.pip.pip_id
}

# module "sqlserver" {
#   source     = "../../Module/Azurerm_Sql_Server"
#   depends_on = [module.rg]
#   sqlserver  = var.sqlserver
# }

# module "sqldb" {
#   source     = "../../Module/Azurerm_Sql_db"
#   depends_on = [module.sqlserver]
#   sqldb      = var.sqldb

# }
