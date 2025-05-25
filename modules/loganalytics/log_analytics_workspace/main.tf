// Create Azure Log Analytics Workspaces based on settings in var.log_analytics_workspace_settings
resource "azurerm_log_analytics_workspace" "law" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = try(var.log_analytics_workspace_settings.sku, "PerGB2018")

  dynamic "identity" {
    for_each = try(var.log_analytics_workspace_settings.identity, null) == null ? [] : [var.log_analytics_workspace_settings.identity]
    content {
      type         = try(var.log_analytics_workspace_settings.identity.type, "SystemAssigned")
      identity_ids = try(var.log_analytics_workspace_settings.identity.type, "") == "UserAssigned" ? try(var.log_analytics_workspace_settings.identity.identity_ids, []) : []
    }
  }

  retention_in_days               = try(var.log_analytics_workspace_settings.retention_in_days, 30)
  daily_quota_gb                  = try(var.log_analytics_workspace_settings.daily_quota_gb, null)
  allow_resource_only_permissions = try(var.log_analytics_workspace_settings.allow_resource_only_permissions, false)
  local_authentication_disabled   = try(var.log_analytics_workspace_settings.local_authentication_disabled, false)
  internet_ingestion_enabled      = try(var.log_analytics_workspace_settings.internet_ingestion_enabled, true)
  internet_query_enabled          = try(var.log_analytics_workspace_settings.internet_query_enabled, true)
  cmk_for_query_forced            = try(var.log_analytics_workspace_settings.cmk_for_query_forced, false)
  tags                            = var.tags
}
