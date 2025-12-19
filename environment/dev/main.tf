module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_networking"
  networks   = var.networks
}

module "pub_ip" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.public_ips
}


module "linux_VM" {
  depends_on = [module.virtual_network]
  source     = "../../modules/azurerm_linux_machine"
  vms        = var.vms
}

module "network_security_group" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_network_security_group"
  nsgs       = var.nsgs
}


module "database" {
  depends_on   = [module.server]
  source       = "../../modules/azurerm_sql_database"
  sql_database = var.sql_database

}


module "server" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_sql_server"
  servers    = var.servers
}


module "key_vaults" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_key_vault"
  dev-kv     = var.dev-kv
}













