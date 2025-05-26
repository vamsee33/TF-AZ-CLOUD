output "id" {
  description = "The ID of the Key Vault key."
  value       = azurerm_key_vault_key.key.id
}

output "name" {
  description = "The name of the Key Vault key."
  value       = azurerm_key_vault_key.key.name
}

output "version" {
  description = "The current version of the Key Vault key."
  value       = azurerm_key_vault_key.key.version
}

output "key_uri" {
  description = "The URI of the Key Vault key."
  value       = azurerm_key_vault_key.key.key_uri
}
