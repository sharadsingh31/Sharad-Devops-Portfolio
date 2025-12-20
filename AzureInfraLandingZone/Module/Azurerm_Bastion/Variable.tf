variable"bastion" {
    type = map(object({
        name = string
        location = string
        resource_group_name = string

        ip_configuration = map(object({
            name = string
            subnet_id = optional(string)
            public_ip_address_id = optional(string)
        }))


    }))

    }