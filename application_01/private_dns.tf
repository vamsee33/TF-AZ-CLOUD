## Azure Private DNS Zone
module "private_dns_zone" {
  for_each            = try(local.private_dns_zones, {})
  source              = "../modules/network/private_dns_zone"
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.app1.name
  tags                = var.tags
}
## Azure DNS vNET Link
module "dns_vnet_link" {
  source                = "../modules/network/private_dns_vnet_link"
  name                  = "#Name#"
  resource_group_name   = data.azurerm_resource_group.app1.name
  tags                  = {}
  virtual_network_id    = ""
  private_dns_zone_name = ""
  registration_enabled  = true
}

# Private DNS locals
locals {
  private_dns_zones = {
    blob = {
      name = "#Name#"
    }
  }
}
