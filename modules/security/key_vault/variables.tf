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

variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained for once soft-deleted. Must be between 7 and 90."
  type        = number
  default     = 90
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

variable "enabled_for_deployment" {
  description = "Whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the Key Vault."
  type        = bool
  default     = false
}

variable "enabled_for_disk_encryption" {
  description = "Whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
  type        = bool
  default     = false
}

variable "enabled_for_template_deployment" {
  description = "Whether Azure Resource Manager is permitted to retrieve secrets from the Key Vault."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed for this Key Vault."
  type        = bool
  default     = true
}

variable "enable_rbac_authorization" {
  description = "Whether RBAC authorization is enabled for this Key Vault."
  type        = bool
  default     = false
}
variable "tags" {
  default = {}
}
