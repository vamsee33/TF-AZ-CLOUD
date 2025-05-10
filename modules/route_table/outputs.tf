output "route_table_obj" {
  description = "Returns the full object of the created route table"
  value       = azurerm_route_table.route_table
}

output "route_table_id" {
  description = "Returns the ID of the created route table"
  value       = azurerm_route_table.route_table.id
}

output "route_table_name" {
  description = "Returns the name of the created route table"
  value       = azurerm_route_table.route_table.name
}