variable "name" {
  description = "The name of the private endpoint."
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

variable "subnet_id" {
  description = "The ID of the subnet for the private endpoint."
  type        = string
}

variable "private_service_connection" {
  description = "A map/object describing the private service connection block."
  type        = any
  default     = {}
}

variable "private_dns_zone_group" {
  description = "A map/object describing the private DNS zone group block."
  type        = any
  default     = null
}

variable "tags" {
  description = "Tags to apply to the private endpoint."
  type        = map(string)
  default     = {}
}
