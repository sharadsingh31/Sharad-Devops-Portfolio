variable "vms" {
  type = map(object({
    vm_name              = string
    resource_group_name  = string
    location             = string
    size                 = string
    nic_name             = string
    subnet_name          = string
    virtual_network_name = string
    pip_name             = string
    caching              = string
    storage_account_type = string
    publisher            = string
    offer                = string
    sku                  = string
    version              = string
    tags                 = map(string)

   
    ip_configuration = map(object({
      name = string
      # subnet_id                     = optional(string) #No need variable if use data block as share value like ahard code, if decalre value then need to assign value in tfvars
      # private_ip_address_allocation = optional(string)
      # public_ip_address_id          = optional(string)
    }))
  }))

}


variable "pip_id" {
  type = map(string)
}