module "loganalytics" {
  for_each                         = try(local.log_analytics, {})
  source                           = "../modules/loganalytics/log_analytics_workspace"
  log_analytics_workspace_settings = each.value
}
