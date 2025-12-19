
variable "dev-kv" {
  type = map(object({
    key_name = string
    location = string
    rg_name  = string
    access_policys = map(object({
      key_permissions     = list(string)
      secret_permissions  = list(string)
      storage_permissions = list(string)
      }

    ))

  }))

}
