output "id" {
  description = "The ID of the storage container."
  value       = azurerm_storage_container.this.id
}

output "name" {
  description = "The name of the storage container."
  value       = azurerm_storage_container.this.name
}
