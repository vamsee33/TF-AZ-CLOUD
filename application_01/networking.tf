
###<<<This will contain vNets, Subnets, Route Tables, Network security group, Subnet associations b/w RT AND NSG>>>###
## Virtual Network
module "virtual_network" {
  # for_each            = try(local.virtual_networks, {})
  source              = "../modules/network/virtual_network"
  resource_group_name = data.azurerm_resource_group.app1.name
  location            = "WESTUS3"
  name                = "vnet-name"
  address_space       = ["10.0.0.0/22"]
  encryption_enabled  = true
  tags                = try(var.tags, {})
  # ddos_id             = null
  # ddos_enabled        = null

}
## subnets
module "subnets" {
  source               = "../modules/network/subnet"
  for_each             = local.subnets
  subnets              = each.value
  resource_group_name  = data.azurerm_resource_group.app1.name
  virtual_network_name = module.virtual_network.name
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
  location            = "EASTUS2"
  tags                = var.tags
}
module "nsg_association" {
  for_each                  = try(local.nsg_associations, {})
  source                    = "../modules/network/subnet_nsg_association"
  subnet_id                 = module.subnets.ids[each.value.subnet_key]
  network_security_group_id = module.nsg[each.value.nsg_key].id
}

module "nsg_association" {
  for_each       = try(local.rt_associations, {})
  source         = "../modules/network/route_subnet_association"
  subnet_id      = module.subnets.ids[each.value.subnet_key]
  route_table_id = module.route_table[each.value.rt_key].id
}
