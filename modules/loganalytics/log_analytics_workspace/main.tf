// Create Azure Log Analytics Workspaces based on settings in var.log_analytics_workspace_settings
resource "azurerm_log_analytics_workspace" "law" {

  // Basic Information
  name                = var.log_analytics_workspace_settings.name
  resource_group_name = var.log_analytics_workspace_settings.resource_group_name
  location            = var.log_analytics_workspace_settings.location
  sku                 = try(var.log_analytics_workspace_settings.sku, "PerGB2018")
  dynamic "identity" {
    for_each = var.log_analytics_workspace_settings.identity == null ? [] : [var.log_analytics_workspace_settings.identity]
    content {
      type         = var.log_analytics_workspace_settings.identity.type
      identity_ids = var.log_analytics_workspace_settings.identity.type == "UserAssigned" ? var.var.log_analytics_workspace_settings.identity.identity_ids : []
    }

  }

  // Data Retention and Quotas
  retention_in_days = var.log_analytics_workspace_settings.retention_in_days // Data retention period in days
  daily_quota_gb    = var.log_analytics_workspace_settings.daily_quota_gb    // Daily data ingestion quota in GB

  // Permissions and Authentication
  allow_resource_only_permissions = var.log_analytics_workspace_settings.allow_resource_only_permissions
  local_authentication_disabled   = var.log_analytics_workspace_settings.local_authentication_disabled

  // Data Ingestion and Query Settings
  internet_ingestion_enabled = var.log_analytics_workspace_settings.internet_ingestion_enabled
  internet_query_enabled     = var.log_analytics_workspace_settings.internet_query_enabled

  // Customer Managed Key for Query
  cmk_for_query_forced = var.log_analytics_workspace_settings.cmk_for_query_forced

  // Common Tags
  tags = var.tags
}
