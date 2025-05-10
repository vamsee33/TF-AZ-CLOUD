resource "azurerm_virtual_network" "vnet" {
  name                = var.networking_object.vnet.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.networking_object.vnet.address_space
  tags                = var.tags

  dns_servers = lookup(var.networking_object.vnet, "dns", null)

  dynamic "ddos_protection_plan" {
    for_each = var.ddos_id != "" ? [1] : []

    content {
      id     = var.ddos_id
      enable = true
    }
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = module.resource_naming.name_result
  location            = var.location != null ? var.location : var.global_settings.location
  resource_group_name = var.resource_group_name
  address_space       = var.virtual_network.address_space
  dns_servers         = try(var.virtual_network.dns_servers, []) # NOTE: Since dns_servers can be configured both inline and via the separate azurerm_virtual_network_dns_servers resource, we have to explicitly set it to empty slice ([]) to remove it.
  tags                = local.tags

  dynamic "ddos_protection_plan" {
    for_each = try(var.virtual_network.ddos_protection_plan, null) != null ? [var.virtual_network.ddos_protection_plan] : []
    content {
      id     = coalesce(try(ddos_protection_plan.value.id, null), try(var.network_ddos_protection_plans[ddos_protection_plan.value.ddos_protection_plan_key].id, null))
      enable = try(ddos_protection_plan.value.enable, true)
    }
  }

}