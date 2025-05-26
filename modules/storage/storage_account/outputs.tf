output "id" {
  description = "The ID of the storage account."
  value       = azurerm_storage_account.storage.id
}

output "name" {
  description = "The name of the storage account."
  value       = azurerm_storage_account.storage.name
}

output "primary_connection_string" {
  description = "The primary connection string for the storage account."
  value       = azurerm_storage_account.storage.primary_connection_string
}

output "identity" {
  description = "The system-assigned managed identity block for the storage account."
  value       = azurerm_storage_account.storage.identity[0]
}

output "principal_id" {
  description = "The principal_id of the system-assigned managed identity for the storage account."
  value       = azurerm_storage_account.storage.identity[0].principal_id
}
