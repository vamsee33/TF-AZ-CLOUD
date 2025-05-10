resource "azurerm_eventhub_consumer_group" "evhcg" {
  name                = var.settings.name
  namespace_name      = var.namespace_name
  eventhub_name       = var.eventhub_name
  resource_group_name      = var.resource_group
  user_metadata       = try(var.settings.user_metadata, null)
}

output "id" {
  description = "The ID of the EventHub Consumer Group."
  value       = azurerm_eventhub_consumer_group.evhcg.id
}

variable "settings" {}

variable "resource_group" {
  description = "Resource group objects."
}

variable "namespace_name" {
  description = "Name of the Event Hub Namespace."
  type        = string
}

variable "eventhub_name" {
  description = "Name of the Event Hub."
  type        = string
}