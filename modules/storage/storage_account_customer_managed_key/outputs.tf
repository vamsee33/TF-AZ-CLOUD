output "id" {
  description = "The ID of the storage account customer managed key association."
  value       = azurerm_storage_account_customer_managed_key.cmk.id
}

output "storage_account_id" {
  description = "The ID of the storage account."
  value       = azurerm_storage_account_customer_managed_key.cmk.storage_account_id
}

output "key_vault_key_id" {
  description = "The ID of the Key Vault key used for encryption."
  value       = azurerm_storage_account_customer_managed_key.cmk.key_vault_key_id
}

output "user_assigned_identity_id" {
  description = "The ID of the user-assigned managed identity used for accessing the Key Vault key."
  value       = azurerm_storage_account_customer_managed_key.cmk.user_assigned_identity_id
}
