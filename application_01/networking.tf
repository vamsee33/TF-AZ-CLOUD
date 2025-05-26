###<<<This will contain vNets, Subnets, Route Tables, Network security group, Subnet associations b/w RT AND NSG>>>###
## Virtual Network
module "virtual_network" {
  source              = "../modules/network/virtual_network"
  resource_group_name = data.azurerm_resource_group.app1.name
  location            = var.location
  name                = var.virtual_network_name
  address_space       = var.virtual_network_address_space
  encryption_enabled  = var.virtual_network_encryption_enabled
  tags                = try(var.tags, {})
}

module "virtual_network_2" {
  source              = "../modules/network/virtual_network"
  resource_group_name = data.azurerm_resource_group.app1.name
  location            = var.location
  name                = "vnet2-name"
  address_space       = ["10.1.0.0/22"]
  encryption_enabled  = var.virtual_network_encryption_enabled
  tags                = try(var.tags, {})
}
## subnets
module "subnets" {
  source               = "../modules/network/subnet"
  for_each             = var.subnets
  subnets              = each.value
  resource_group_name  = data.azurerm_resource_group.app1.name
  virtual_network_name = module.virtual_network.name
}
## vNet Peering
module "vnet_peering" {
  source              = "../modules/network/virtual_peering"
  vnet_peering_config = var.vnet_peering_config
  resource_group_name = data.azurerm_resource_group.app1.name
}
module "nsg" {
  source              = "../modules/network/network_security_group"
  subnets             = var.nsg_s
  resource_group_name = data.azurerm_resource_group.app1.name
  location            = var.location
  tags                = try(var.tags, {})
}
module "route_table" {
  source              = "../modules/network/route_table"
  route_table         = var.route_table
  route_table_name    = var.route_table_name
  resource_group_name = data.azurerm_resource_group.app1.name
  location            = var.location
  tags                = var.tags
}
module "nsg_association" {
  source                    = "../modules/network/subnet_nsg_association"
  subnet_id                 = module.subnets["subnet1"].id
  network_security_group_id = module.nsg.id["subnet1"]
}
module "rt_association" {
  source         = "../modules/network/route_subnet_association"
  subnet_id      = module.subnets["subnet1"].id
  route_table_id = module.route_table.id
}
