module "resource_group" {
  source         = "../../Module/Azurerm_Resource_group"
  resource_group = var.dev_resource_group

}

module "storage_account" {
  source          = "../../Module/Azurerm_Storage_account"
  storage_account = var.dev_storage_account
  depends_on      = [module.resource_group]

}

module "virtual_network" {
  source          = "../../Module/Azurerm_VNET"
  depends_on      = [module.resource_group]
  virtual_network = var.dev_virtual_network
}

module "subnet" {
  source     = "../../Module/Azurerm_Subnet"
  depends_on = [module.virtual_network, module.resource_group]
  subnet     = var.dev_subnet
}

module "public_ip" {
  source     = "../../Module/Azurerm_Public_ip"
  depends_on = [module.resource_group]
  public_ip  = var.dev_public_ip
}

# module "bastion" {
#   source     = "../../Module/Azurerm_Bastion"
#   depends_on = [module.subnet, module.public_ip]
# }

module "virtual_machine" {
  source     = "../../Module/Azurerm_VM"
  depends_on = [module.subnet, module.resource_group]
  vm_configs = var.dev_vm_configs

}

#loadbalancer, Frontendipconfig, Backend pool, lbrule, health probe

module "load_balancer" {
  source     = "../../Module/Azurerm_loadbalancer"
  depends_on = [module.public_ip, module.resource_group]

}

module "nic_lb_association1" {
  source     = "../../Module/Azurerm_nic_lb_association"
  depends_on = [module.load_balancer, module.virtual_machine]
  nic_name   = "nic-frontend1"
}

module "nic_lb_association2" {
  source     = "../../Module/Azurerm_nic_lb_association"
  depends_on = [module.load_balancer, module.virtual_machine]
  nic_name   = "nic-frontend2"
}



# module "mssql_server" {
#   source       = "../../Module/Azurerm_SQLServer"
#   depends_on   = [module.resource_group]
#   mssql_server = var.dev_mssql_server
# }

# module "mssql_database" {
#   source         = "../../Module/Azurerm_SQLDatabase"
#   depends_on     = [module.mssql_server]
#   mssql_database = var.dev_mssql_database
# }
