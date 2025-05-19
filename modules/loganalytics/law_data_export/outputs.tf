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
