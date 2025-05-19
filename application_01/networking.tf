## DDOS Plan
module "ddos_plan" {
  source              = "../modules/network/network_ddos_plan"
  name                = "#Name#"
  location            = local.location
  resource_group_name = data.azurerm_resource_group.app1.name
  tags = {
    tag1 = "test"
  }
}
## Azure Private DNS Zone
module "private_dns_zone" {
  for_each            = try(local.private_dns_zones, {})
  source              = "../modules/network/private_dns_zone"
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.app1.name
  tags                = local.tags
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
## Virtual Network
module "virtual_network" {
  for_each            = try(local.virtual_networks, {})
  source              = "../modules/network/virtual_network"
  resource_group_name = data.azurerm_resource_group.app1.name
  networking_object   = each.value
  location            = local.location
  ddos_id             = null
  ddos_enabled        = null

}
## subnets
module "subnets" {
  source               = "../modules/network/subnet"
  subnets              = local.subnets
  resource_group_name  = data.azurerm_resource_group.app1.name
  virtual_network_name = "#vnet-name#"
}
## vNet Peering
module "vnet_peering" {
  for_each            = try(local.vnet_peering_config, {})
  source              = "../modules/network/virtual_peering"
  vnet_peering_config = each.value
  resource_group_name = data.azurerm_resource_group.app1.name
}
module "nsg" {
  # for_each            = tr(local.nsg_s, {})
  source              = "../modules/network/network_security_group"
  subnets             = local.nsg_s
  resource_group_name = data.azurerm_resource_group.app1.name
  location            = "westus3"
}
module "route_table" {
  for_each            = try(local.route_tables, {})
  source              = "../modules/network/route_table"
  route_table         = each.value
  resource_group_name = data.azurerm_resource_group.app1.name
  location            = local.location
  tags                = local.tags
}
module "nsg_association" {
  for_each                  = try(local.nsg_associations, {})
  source                    = "../modules/network/subnet_nsg_association"
  subnet_id                 = module.subnets.ids[each.value.subnet_key]
  network_security_group_id = module.nsg[each.value.nsg_key].id
}

module "nsg_association" {
  for_each       = try(local.rt_associations)
  source         = "../modules/network/route_subnet_association"
  subnet_id      = module.subnets.ids[each.value.subnet_key]
  route_table_id = module.route_table[each.value.rt_key].id
}
