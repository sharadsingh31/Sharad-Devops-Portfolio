variable "resource_grp" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))

  }))

}
variable"storage_account"{
 type = map(object({
    name = string
    resource_group_name = string
    location = string
    account_tier = string
    account_replication_type = string

 })

 )
 }