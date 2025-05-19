output "evh_id" {
  description = "The EventHub Namespace ID."
  value       = azurerm_eventhub_namespace.evh.id
}

output "evh_obj" {
  description = "The EventHub Namespace ID."
  value       = azurerm_eventhub_namespace.evh
}

output "name" {
  description = "The EventHub Namespace name."
  value       = azurerm_eventhub_namespace.evh.name
}