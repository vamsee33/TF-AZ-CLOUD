data "azurerm_client_config" "current" {}

data "azurerm_subscription" "primary" {

}

data "azurerm_resource_group" "app1" {
  name = "Name of the RG"
}
