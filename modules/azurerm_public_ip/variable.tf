
variable "public_ips" {
  description = "Map of public IP configurations"
  type = map(object({
    pip_name            = string
    resource_group_name = string
    location            = string
    allocation_method   = string # Static / Dynamic
    sku                 = optional(string)
    domain_name_label   = optional(string)
    idle_timeout        = optional(number)
    zones               = optional(list(string))
    environment         = optional(string)

  }))
}
