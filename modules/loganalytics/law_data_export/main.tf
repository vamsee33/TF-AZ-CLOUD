resource "azurerm_log_analytics_data_export_rule" "export_rule" {

  name                    = var.law_export_rule.name
  resource_group_name     = var.resource_group_name
  workspace_resource_id   = var.log_analytics_id
  destination_resource_id = var.destination_resource_id
  table_names             = var.law_export_rule.table_names
  enabled                 = var.law_export_rule.data_export_enabled
}
