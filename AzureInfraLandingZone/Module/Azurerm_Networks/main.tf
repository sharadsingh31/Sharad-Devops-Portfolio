resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnet
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
  dns_servers         = each.value.dns_servers
  
  dynamic "ip_address_pool" {
    for_each = each.value.ip_address_pool == null ? [] : each.value.ip_address_pool
    content {
      id = ip_address_pool.id
      number_of_ip_addresses = ip_address_pool.number_of_ip_addresses
    }

  }

  dynamic "subnet" {
    # for_each = each.value.subnet == null ? [] : each.value.subnet
    for_each = lookup(each.value, "subnet", [])
    content {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes
    }

  }


}

