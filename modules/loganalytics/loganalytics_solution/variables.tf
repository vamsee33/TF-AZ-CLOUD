variable "resource_group_name" {
  description = "The resource group of the workspace."
  type        = string
}
variable "workspace_id" {
  description = "The ID of the workspace."
  type        = string
}
variable "workspace_name" {
  description = "The name of the workspace."
  type        = string
}

variable "location" {
  description = "The Azure region of the workspace."
  type        = string
}
