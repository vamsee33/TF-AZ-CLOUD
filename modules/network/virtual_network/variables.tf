variable "resource_group_name" {
  description = "(Required) Name of the resource group where to create the resource. Changing this forces a new resource to be created. "
  type        = string
}

variable "location" {
  description = "(Required) Specifies the Azure location to deploy the resource. Changing this forces a new resource to be created."
  type        = string
}

variable "tags" {
  description = "(Optional) map of tags for the deployment"
  default     = {}
}

variable "networking_object" {
  description = "(Required) configuration object describing the networking configuration, as described in README"
}

variable "ddos_id" {
  description = "(Optional) ID of the DDoS protection plan if exists"
  default     = null
}

variable "ddos_enabled" {
  type    = bool
  default = true
}
