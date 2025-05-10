variable "subnets" {
  description = "A configuration map of subnets deployed in a VNet."
}

variable "resource_group_name" {
  description = "The name of the resource group which holds the virtual network."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network into which the subnet will be deployed."
  type        = string
}

variable "delegation" {
  description = "The optional delegation block for the subnet."
  default     = null
}

output "subnet_ids_map" {
  description = "The output of the subnet oject and all values."
  value       = azurerm_subnet.subnet
}