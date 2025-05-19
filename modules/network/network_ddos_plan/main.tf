resource "azurerm_network_ddos_protection_plan" "resource" {

  name                = var.name
  location            = var.location != null ? var.location : var.global_settings.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}
