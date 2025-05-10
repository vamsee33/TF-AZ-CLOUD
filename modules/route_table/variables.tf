variable "tags" {
  description = "A map of tags for the deployment."
  default     = null
}

variable "route_table" {
  description = "A route table map object to be created."
}

variable "resource_group_name" {
  description = "Name of the resource group where to create the resource"
}

variable "location" {
  description = "Location where to create the resource"
}