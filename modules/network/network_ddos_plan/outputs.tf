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
