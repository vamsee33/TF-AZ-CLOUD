variable "key_vault_id" {
  description = "The ID of the Key Vault in which to create the secret."
  type        = string
}

variable "name" {
  description = "The name of the Key Vault secret."
  type        = string
}

variable "value" {
  description = "The value of the Key Vault secret."
  type        = string
}

variable "content_type" {
  description = "The content type of the secret."
  type        = string
  default     = null
}

variable "enabled" {
  description = "Is the secret enabled?"
  type        = bool
  default     = true
}

variable "expiration_date" {
  description = "The expiration date of the secret (RFC3339 format)."
  type        = string
  default     = null
}

variable "not_before_date" {
  description = "The not before date of the secret (RFC3339 format)."
  type        = string
  default     = null
}
