
# 🔹 Multiple Public IPs using for_each
resource "azurerm_public_ip" "pub_ip" {
  for_each                = var.public_ips
  name                    = each.value.pip_name
  resource_group_name     = each.value.resource_group_name
  location                = each.value.location
  allocation_method       = each.value.allocation_method
  sku                     = each.value.sku
  domain_name_label       = lookup(each.value, "domain_name_label", null)
  idle_timeout_in_minutes = lookup(each.value, "idle_timeout", 10)
  zones                   = lookup(each.value, "zones", [])

}


