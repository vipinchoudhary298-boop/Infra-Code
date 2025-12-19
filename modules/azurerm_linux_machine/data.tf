data "azurerm_subnet" "subnets" {
  for_each             = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}


data "azurerm_public_ip" "pips" {
  for_each            = var.vms
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}


data "azurerm_network_interface" "nic" {
  for_each            = var.vms
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}


data "azurerm_key_vault" "kev" {
  for_each            = var.vms
  name                = each.value.key_name
  resource_group_name = each.value.rg_name
}


data "azurerm_key_vault_secret" "vm_password" {
  for_each     = var.vms
  name         = "vm-password"
  key_vault_id = data.azurerm_key_vault.kev[each.key].id
}

data "azurerm_key_vault_secret" "vm_user" {
  for_each     = var.vms
  name         = "vm-username"
  key_vault_id = data.azurerm_key_vault.kev[each.key].id
}


