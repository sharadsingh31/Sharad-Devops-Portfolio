resource "azurerm_kubernetes_cluster" "aks" {
  for_each            = var.aksdetails
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix
  tags                = each.value.tags

  default_node_pool {

    name       = each.value.default_node_pool.name
    node_count = each.value.default_node_pool.node_count
    vm_size    = each.value.default_node_pool.vm_size

  }
  
  dynamic "identity" {
    for_each = each.value.identity
content {
  type = identity.value.type
  
}
    
  }


}

