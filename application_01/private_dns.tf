## Azure Private DNS Zone
module "private_dns_zone" {
  for_each            = var.private_dns_zones
  source              = "../modules/network/private_dns_zone"
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.app1.name
  tags                = var.tags
}

## Azure DNS vNET Link
module "dns_vnet_link" {
  for_each              = var.private_dns_zones
  source                = "../modules/network/private_dns_vnet_link"
  name                  = "${each.value.name}-link"
  resource_group_name   = data.azurerm_resource_group.app1.name
  tags                  = var.tags
  virtual_network_id    = module.virtual_network.id
  private_dns_zone_name = module.private_dns_zone[each.key].name
  registration_enabled  = var.dns_vnet_link_registration_enabled
}
