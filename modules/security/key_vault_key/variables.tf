variable "key_vault_id" {
  description = "The ID of the Key Vault in which to create the key."
  type        = string
}

variable "key_name" {
  description = "The name of the Key Vault key."
  type        = string
}

variable "key_type" {
  description = "The type of the key to create."
  type        = string
  default     = "RSA"
}

variable "key_size" {
  description = "The size of the key to create."
  type        = number
  default     = 2048
}

variable "key_opts" {
  description = "A list of key operations."
  type        = list(string)
  default     = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
}

variable "enabled" {
  description = "Is the key enabled?"
  type        = bool
  default     = true
}

variable "enable_rotation_policy" {
  description = "Whether to enable the rotation policy for the key."
  type        = bool
  default     = true
}

variable "rotation_expire_after" {
  description = "The period after which the key expires (ISO 8601 duration)."
  type        = string
  default     = "P90D"
}

variable "rotation_notify_before_expiry" {
  description = "The period before expiry to notify (ISO 8601 duration)."
  type        = string
  default     = "P30D"
}

variable "rotation_time_before_expiry" {
  description = "The period before expiry to automatically rotate (ISO 8601 duration)."
  type        = string
  default     = "P7D"
}
