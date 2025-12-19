variable "vms" {
  type = map(object(
    {
      nic_name    = string
      location    = string
      rg_name     = string
      vnet_name   = string
      pip_name    = string
      subnet_name = string
      ip_configurations = map(object({
        name                          = string
        private_ip_address_allocation = string

      }))
      vm_name                = string
      vm_size                = string
      key_name               = string
      os_disk                = map(string)
      source_image_reference = map(string)
  }))
}
