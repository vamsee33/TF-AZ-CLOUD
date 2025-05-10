resource "azurerm_log_analytics_data_export_rule" "export_rule" {

  name                    = module.resource_naming.name_result
  resource_group_name     = var.resource_group_name
  workspace_resource_id   = var.log_analytics
  destination_resource_id = var.destination_resource_id
  table_names             = var.law_export_rule.table_names
  enabled                 = var.law_export_rule.data_export_enabled
}

output "id" {
  description = "The ID of the created Data Export Rule."
  value       = azurerm_log_analytics_data_export_rule.export_rule.id
}

output "export_rule_id" {
  description = "The ID of the created Data Export Rule. "
  value       = azurerm_log_analytics_data_export_rule.export_rule.export_rule_id
}

output "export_rule" {
  description = "All attributes of the log analytics export rule"
  value       = azurerm_log_analytics_data_export_rule.export_rule
}

variable "global_settings" {
  description = "Global settings object"
}
variable "resource_group_name" {
  description = "The name of the resource group in which the resource is created"
  type        = string
}

variable "law_export_rule" {
  description = "Configuration settings object for the Data export rule"
}

variable "log_analytics" {
  description = "Configuration settings object for the Log Analytics Workspace resource"
}

variable "destination_resource_id" {
  description = "The destination resource ID. It should be a storage account, an event hub namespace or an event hub. If the destination is an event hub namespace, an event hub would be created for each table automatically."
}