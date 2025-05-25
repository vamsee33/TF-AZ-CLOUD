// Variables for Log Analytics Workspace Settings
variable "log_analytics_workspace_settings" {
  description = "Settings for the Log Analytics Workspace except name, resource_group_name, location, and tags."
  type = object({
    sku = optional(string)
    identity = optional(object({
      type         = string
      identity_ids = optional(list(string))
    }))
    retention_in_days               = optional(number)
    daily_quota_gb                  = optional(string)
    allow_resource_only_permissions = optional(bool)
    local_authentication_disabled   = optional(bool)
    internet_ingestion_enabled      = optional(bool)
    internet_query_enabled          = optional(bool)
    cmk_for_query_forced            = optional(bool)
  })
  default = {}
}

// Common tags for all Azure resources created
variable "tags" {
  description = "Common tags for all resources."
  type        = map(any)
  default     = {}
}

variable "name" {
  description = "Name of the Log Analytics Workspace."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name for the Log Analytics Workspace."
  type        = string
}

variable "location" {
  description = "Location for the Log Analytics Workspace."
  type        = string
}
