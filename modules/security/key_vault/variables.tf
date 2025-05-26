variable "name" {
  description = "The name of the Key Vault."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region."
  type        = string
}

variable "sku_name" {
  description = "The SKU name of the Key Vault."
  type        = string
  default     = "standard"
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID."
  type        = string
}

variable "soft_delete_enabled" {
  description = "Is soft delete enabled for this Key Vault?"
  type        = bool
  default     = true
}

variable "purge_protection_enabled" {
  description = "Is purge protection enabled for this Key Vault?"
  type        = bool
  default     = false
}

variable "access_policies" {
  description = "A list of access policies for the Key Vault."
  type        = list(any)
  default     = []
}

variable "network_acls" {
  description = "Network ACLs for the Key Vault."
  type        = any
  default     = null
}
