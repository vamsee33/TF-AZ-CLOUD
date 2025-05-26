resource "azurerm_private_endpoint" "pe" {
  name                = try(var.name, null)
  location            = try(var.location, null)
  resource_group_name = try(var.resource_group_name, null)
  subnet_id           = try(var.subnet_id, null)
  tags                = try(var.tags, {})

  dynamic "private_service_connection" {
    for_each = length(keys(try(var.private_service_connection, {}))) > 0 ? [var.private_service_connection] : []
    content {
      name                           = try(private_service_connection.value.name, null)
      private_connection_resource_id = try(private_service_connection.value.private_connection_resource_id, null)
      is_manual_connection           = try(private_service_connection.value.is_manual_connection, false)
      subresource_names              = try(private_service_connection.value.subresource_names, null)
      request_message                = try(private_service_connection.value.request_message, null)
    }
  }

  dynamic "private_dns_zone_group" {
    for_each = var.private_dns_zone_group != null ? [var.private_dns_zone_group] : []
    content {
      name                 = try(private_dns_zone_group.value.name, null)
      private_dns_zone_ids = try(private_dns_zone_group.value.private_dns_zone_ids, null)
    }
  }
}
