resource "azurerm_bastion_host" "example" {
    for_each = var.bastion
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "ip_configuration" {
    for_each = each.value.ip_configuration
    content {
    name                 = ip_configuration.value.name
    subnet_id            = data.azurerm_subnet.subnets[each.key].id
    public_ip_address_id = "Dynamic"
  }
}
}

