output "id" {
  description = "The ID of the Key Vault secret."
  value       = azurerm_key_vault_secret.secret.id
}

output "name" {
  description = "The name of the Key Vault secret."
  value       = azurerm_key_vault_secret.secret.name
}

output "version" {
  description = "The current version of the Key Vault secret."
  value       = azurerm_key_vault_secret.secret.version
}

output "value" {
  description = "The value of the Key Vault secret."
  value       = azurerm_key_vault_secret.secret.value
}
