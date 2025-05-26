output "id" {
  description = "The ID of the Key Vault."
  value       = azurerm_key_vault.vault.id
}

output "name" {
  description = "The name of the Key Vault."
  value       = azurerm_key_vault.vault.name
}

output "vault_uri" {
  description = "The URI of the Key Vault."
  value       = azurerm_key_vault.vault.vault_uri
}
