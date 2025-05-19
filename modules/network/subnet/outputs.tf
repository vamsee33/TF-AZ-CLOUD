output "subnet_ids_map" {
  description = "The output of the subnet oject and all values."
  value       = azurerm_subnet.subnet
}
output "name" {
  value = { for k, v in azurerm_subnet.subnet : k => v.name }
}
output "ids" {
  value = { for k, v in azurerm_subnet.subnet : k => v.id }
}
