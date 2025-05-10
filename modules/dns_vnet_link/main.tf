resource "azurerm_private_dns_zone_virtual_network_link" "vnet_links" {
  for_each = var.settings.private_dns_zones

  name                  = module.resource_naming[each.key].name_result
  resource_group_name   = try(var.private_dns[each.value.private_dns_zone_key].resource_group_name, var.resource_group_name)
  private_dns_zone_name = can(each.value.private_dns_zone_name) ? each.value.private_dns_zone_name : var.private_dns[each.value.private_dns_zone_key].name
  virtual_network_id    = can(each.value.virtual_network_id) ? each.value.virtual_network_id : var.virtual_networks[each.value.vnet_key].id
  registration_enabled  = try(each.value.registration_enabled, false)
  # tags                  = local.tags
}