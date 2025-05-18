output "nsg_obj" {
  value       = azurerm_network_security_group.nsg_obj
  description = "All attributes for the Network security group"
}
output "id" {
  value = azurerm_network_security_group.nsg_obj.id
}
