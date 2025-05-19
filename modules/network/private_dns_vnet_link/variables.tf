variable "resource_group_name" {
  description = "(Required) Name of the resource group where to create the resource. Changing this forces a new resource to be created. "
  type        = string
}
variable "tags" {
  description = "(Optional) map of tags for the deployment"
  default     = {}
}
variable "name" {
  description = "(Required) The name of the Private DNS Zone Virtual Network Link. Changing this forces a new resource to be created."
  type        = string
}
variable "private_dns_zone_name" {
  description = "(Required) The name of the Private DNS zone (without a terminating dot). Changing this forces a new resource to be created."
  type        = string

}
variable "virtual_network_id" {
  description = "(Required) The ID of the Virtual Network that should be linked to the DNS Zone. Changing this forces a new resource to be created."
}
variable "registration_enabled" {
  type    = bool
  default = false
}
