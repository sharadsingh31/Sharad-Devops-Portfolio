resource "azurerm_network_interface" "nic" {
  for_each            = var.vms
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "ip_configuration" {
    for_each = each.value.ip_configuration
    content {
      name                          = ip_configuration.value.name
      subnet_id                     = data.azurerm_subnet.subnets[each.key].id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id          = var.pip_id[each.key] # if you want assign public IP to VM then this argumet need to be use
    }
  }

  tags = each.value.tags
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.vms

  name                  = each.value.vm_name
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
  size                  = each.value.size
  admin_username        = data.azurerm_key_vault_secret.kv_username.value
  admin_password        = data.azurerm_key_vault_secret.kv_password.value
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.nic[each.key].id] #nic attach in vm
  tags                  = each.value.tags


  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }

}