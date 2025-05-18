resource "azurerm_private_dns_zone_virtual_network_link" "links" {
  name                  = var.name
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = var.private_dns_zone_name
  virtual_network_id    = var.virtual_network_id
  tags                  = var.tags
  registration_enabled  = var.registration_enabled
}
