## DDOS Plan
module "ddos_plan" {
  source              = "../modules/network/network_ddos_plan"
  name                = "#Name#"
  location            = "SOUTHINDIA"
  resource_group_name = data.azurerm_resource_group.app1.name
  tags = {
    tag1 = "test"
  }
}
