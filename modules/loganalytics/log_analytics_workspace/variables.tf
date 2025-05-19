// Variables for Log Analytics Workspace Settings
# variable "log_analytics_workspace_settings" {
#   type = list(object({
#     name                            = string
#     resource_group_name             = string
#     location                        = string
#     sku                             = string
#     retention_in_days               = optional(number)
#     daily_quota_gb                  = optional(number)
#     allow_resource_only_permissions = optional(bool)
#     local_authentication_disabled   = optional(bool)
#     internet_ingestion_enabled      = optional(bool)
#     internet_query_enabled          = optional(bool)
#     cmk_for_query_forced            = optional(bool)
#   }))

# }
variable "log_analytics_workspace_settings" {}
// Common tags for all Azure resources created
variable "tags" {
  description = "Common tags for all resources"
  default     = {}
}
