variable "vnet" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    dns_servers         = optional(list(string))
    ip_address_pool    = optional(list(string))
    
    subnet = optional(list(object({
      name = string
      address_prefixes = list(string)
    })))

   
  }))
  default = {}
}
