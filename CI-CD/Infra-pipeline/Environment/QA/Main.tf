module "qarsg" {
  source       = "../../Module/Resource_group"
  resource_grp = var.resource_grp
}


module "qastg" {
  source          = "../../Module/Storage_account"
  depends_on = [ module.qarsg ]
  storage_account = var.storage_account
}

