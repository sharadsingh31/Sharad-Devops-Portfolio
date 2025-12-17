module "devrsg" {
  source       = "../../Module/Resource_group"
  resource_grp = var.resource_grp
}


module "devstg" {
  source          = "../../Module/Storage_account"
  depends_on = [ module.devrsg ]
  storage_account = var.storage_account
}

