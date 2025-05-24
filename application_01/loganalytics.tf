module "loganalytics" {
  # for_each                         = try(local.log_analytics, {})
  source                           = "../modules/loganalytics/log_analytics_workspace"
  log_analytics_workspace_settings = local.log_analytics
}

#log_analytics locals
locals {
  log_analytics = {
    name                = "#Name#"
    resource_group_name = "#RGNAME#"
    location            = "WESTUS3"
    sku                 = "PerGB2018"
    identity = {
      type = "SystemAssigned"
    }
    retention_in_days = 90
    daily_quota_gb    = "1GB"
  }
}
