// Output IDs of Log Analytics Workspace
output "log_analytics_workspace_id" {
  value       = azurerm_log_analytics_workspace.law.id
  description = "IDs of Log Analytics Workspace"
}

// Output Primary Keys of Log Analytics Workspace (Sensitive)
output "log_analytics_workspace_primary_key" {
  value       = azurerm_log_analytics_workspace.law.primary_shared_key
  description = "Primary Shared Keys of Log Analytics Workspace"
  sensitive   = true
}

// Output Secondary Keys of Log Analytics Workspace (Sensitive)
output "log_analytics_workspace_secondary_key" {
  value       = azurerm_log_analytics_workspace.law.secondary_shared_key
  description = "Secondary Shared Keys of Log Analytics Workspace"
  sensitive   = true
}

output "principal_id" {
  value = try(azurerm_log_analytics_workspace.law.identity.0.principal_id, null)
}
