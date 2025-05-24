resource "azurerm_virtual_network" "vnet" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = try(var.tags, {})

  dns_servers = try(var.dns_servers, [])

  dynamic "encryption" {
    for_each = var.encryption_enabled ? [1] : []
    content {
      enforcement = "AllowUnencrypted" # currently this option available as of 24-May-2025
    }
  }

  dynamic "ddos_protection_plan" {
    for_each = try(var.ddos_id, null) != null ? [1] : []

    content {
      id     = try(var.ddos_id, null)
      enable = try(var.ddos_enabled, true)
    }
  }
}
