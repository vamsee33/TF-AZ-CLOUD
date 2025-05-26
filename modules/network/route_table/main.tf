resource "azurerm_route_table" "route_table" {
  name                = var.route_table_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
  # disable_bgp_route_propagation = try(var.route_table.disable_bgp_route_propagation, null)

  dynamic "route" {
    for_each = try(var.route_table.route, null) != null ? var.route_table.route : []
    content {
      name                   = route.value.name
      address_prefix         = route.value.prefix
      next_hop_type          = try(route.value.next_hop_type, null)
      next_hop_in_ip_address = try(route.value.next_hop_in_ip_address, null)
    }
  }
}
