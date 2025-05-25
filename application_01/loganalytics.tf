module "loganalytics" {
  source                           = "../modules/loganalytics/log_analytics_workspace"
  name                             = var.log_analytics_workspace_name
  resource_group_name              = var.resource_group_name
  location                         = var.location
  tags                             = var.tags
  log_analytics_workspace_settings = var.log_analytics_workspace_settings
}
