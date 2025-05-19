resource "azurerm_virtual_network_peering" "peering" {
  name                         = var.vnet_peering_config.name
  resource_group_name          = var.resource_group_name
  virtual_network_name         = var.vnet_peering_config.virtual_network_name
  remote_virtual_network_id    = var.vnet_peering_config.remote_virtual_network_id
  allow_virtual_network_access = try(var.vnet_peering_config.allow_virtual_network_access, true)
  allow_forwarded_traffic      = try(var.vnet_peering_config.allow_forwarded_traffic, false)
  allow_gateway_transit        = try(var.vnet_peering_config.allow_gateway_transit, false)
  use_remote_gateways          = try(var.vnet_peering_config.use_remote_gateways, false)
}
