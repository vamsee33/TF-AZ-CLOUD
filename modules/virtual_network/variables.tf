variable "resource_group_name" {
  description = "(Required) Name of the resource group where to create the resource. Changing this forces a new resource to be created. "
  type        = string
}

variable "location" {
  description = "(Required) Specifies the Azure location to deploy the resource. Changing this forces a new resource to be created."
  type        = string
}

variable "tags" {
  description = "(Required) map of tags for the deployment"
}

variable "diagnostics_map" {
  description = "(Required) contains the SA and EH details for operations diagnostics"
}

variable "log_analytics_workspace" {
  description = "(Required) contains the log analytics workspace details for operations diagnostics"
}

variable "networking_object" {
  description = "(Required) configuration object describing the networking configuration, as described in README"
}

variable "netwatcher" {
  description = "(Optional) is a map with two attributes: name, rg who describes the name and rg where the netwatcher was already deployed"
  default     = {}
}

variable "ddos_id" {
  description = "(Optional) ID of the DDoS protection plan if exists"
  default     = ""
}

variable "delegation" {
  description = "Subnet delegation for Azure service."
  default     = null
}

output "vnet" {
  description = "For a Vnet, returns: <br> -vnet_name <br> - vnet_adress_space <br> - vnet_id <br> - vnet_dns"
  value = {
    "vnet_name"          = azurerm_virtual_network.vnet.name
    "vnet_address_space" = azurerm_virtual_network.vnet.address_space
    "vnet_id"            = azurerm_virtual_network.vnet.id
    "vnet_dns"           = azurerm_virtual_network.vnet.dns_servers
  }
}