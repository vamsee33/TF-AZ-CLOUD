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
