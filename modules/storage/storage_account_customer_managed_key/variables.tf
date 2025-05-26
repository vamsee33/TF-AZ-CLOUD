variable "storage_account_id" {
  description = "The ID of the storage account to associate with the customer-managed key."
  type        = string
}

variable "key_vault_id" {
  description = "The ID of the Key Vault  to use for customer-managed encryption."
  type        = string
}

variable "key_name" {
  description = "The name of the Key Vault key."
  type        = string
}

variable "user_assigned_identity_id" {
  description = "The ID of the user-assigned managed identity to use for accessing the Key Vault key."
  type        = string
  default     = null
}
