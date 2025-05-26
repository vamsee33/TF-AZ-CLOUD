variable "name" {
  description = "The name of the storage container."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
}

variable "container_access_type" {
  description = "The access type of the container."
  type        = string
  default     = "private"
}

variable "metadata" {
  description = "A mapping of metadata to assign to the container."
  type        = map(string)
  default     = {}
}

variable "default_encryption_scope" {
  description = "The default encryption scope to set on the container."
  type        = string
  default     = null
}


