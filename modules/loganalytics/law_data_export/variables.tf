
variable "resource_group_name" {
  description = "The name of the resource group in which the resource is created"
  type        = string
}

variable "law_export_rule" {
  description = "Configuration settings object for the Data export rule"
}

variable "log_analytics_id" {
  description = "Configuration settings object for the Log Analytics Workspace resource"
}

variable "destination_resource_id" {
  description = "The destination resource ID. It should be a storage account, an event hub namespace or an event hub. If the destination is an event hub namespace, an event hub would be created for each table automatically."
}
