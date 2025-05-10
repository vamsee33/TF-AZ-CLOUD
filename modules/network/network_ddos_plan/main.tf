resource "azurerm_network_ddos_protection_plan" "resource" {

  name                = module.resource_naming.name_result
  location            = var.location != null ? var.location : var.global_settings.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

variable "global_settings" {
  description = "Global settings object"
}
variable "resource_group_name" {
  description = "The name of the resource group in which the resource is created"
  type        = string
}
variable "location" {
  description = "Specifies the supported Azure location where to create the resource. Ommitting this variable will default to the var.global_settings.location value."
  type        = string
  default     = null
}
variable "tags" {
  description = "Custom tags for the resource"
  default     = {}
}
variable "settings" {
  description = "Configuration settings object for the resource"
}

output "id" {
  description = "The ID of the DDoS Protection Plan"
  value       = azurerm_network_ddos_protection_plan.resource.id
}
output "name" {
  description = "The Name of the DDoS Protection Plan"
  value       = azurerm_network_ddos_protection_plan.resource.name
}
output "virtual_network_ids" {
  description = "A list of Virtual Network IDs associated with the DDoS Protection Plan"
  value       = azurerm_network_ddos_protection_plan.resource.virtual_network_ids
}