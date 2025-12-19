resource "azurerm_mssql_server" "sql_server" {
  for_each                     = var.servers
  name                         = each.value.server_name
  resource_group_name          = each.value.rg_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = data.azurerm_key_vault_secret.server_login[each.key].id
  administrator_login_password = data.azurerm_key_vault_secret.server_password[each.key].id
  minimum_tls_version          = each.value.tls_version
}

