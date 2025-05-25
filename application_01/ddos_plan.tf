## DDOS Plan
module "ddos_plan" {
  source              = "../modules/network/network_ddos_plan"
  name                = var.ddos_plan_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.app1.name
  tags                = var.tags
}
