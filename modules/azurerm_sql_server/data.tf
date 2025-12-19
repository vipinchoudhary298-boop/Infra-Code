data "azurerm_key_vault" "kev1" {
  for_each            = var.servers
  name                = each.value.key_name
  resource_group_name = each.value.rg_name
}


data "azurerm_key_vault_secret" "server_login" {
  for_each     = var.servers
  name         = "server-login"
  key_vault_id = data.azurerm_key_vault.kev1[each.key].id
}

data "azurerm_key_vault_secret" "server_password" {
  for_each     = var.servers
  name         = "server-password"
  key_vault_id = data.azurerm_key_vault.kev1[each.key].id
}
