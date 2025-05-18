resource "azurerm_virtual_network" "vnet" {
  name                = var.networking_object.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.networking_object.address_space
  tags                = try(var.tags, {})

  dns_servers = lookup(var.networking_object, "dns", null)

  dynamic "ddos_protection_plan" {
    for_each = try(var.ddos_id, null) != null ? [1] : []

    content {
      id     = try(var.ddos_id, null)
      enable = try(var.ddos_enabled, true)
    }
  }
}
