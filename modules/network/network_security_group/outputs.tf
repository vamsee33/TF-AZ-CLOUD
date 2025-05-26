output "nsg_obj" {
  value       = azurerm_network_security_group.nsg_obj
  description = "All attributes for the Network security group"
}
output "id" {
  value       = { for k, nsg in azurerm_network_security_group.nsg_obj : k => nsg.id }
  description = "A map of NSG IDs by key."
}
