variable "name" {
  description = "The name of the storage account."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the storage account."
  type        = map(string)
  default     = {}
}

variable "storage_config" {
  description = "Storage account configuration object."
  default = {
    account_tier                  = "Standard"
    account_replication_type      = "LRS"
    kind                          = "StorageV2"
    access_tier                   = "Hot"
    public_network_access_enabled = true
    min_tls_version               = "TLS1_2"
    shared_access_key_enabled     = true
    custom_domain                 = null
    identity = {
      type = "SystemAssigned"
    }
    blob_properties = null
    network_rules = {
      default_action             = "Allow"
      bypass                     = ["AzureServices"]
      ip_rules                   = []
      virtual_network_subnet_ids = []
    }
    is_hns_enabled                   = false
    allow_nested_items_to_be_public  = false
    table_encryption_key_type        = null
    queue_encryption_key_type        = null
    sas_policy_expiration_period     = null
    sas_policy_expiration_action     = null
    cross_tenant_replication_enabled = false
    https_traffic_only_enabled       = true
  }
}

# variable "log_analytics_workspace_id" {
#   description = "The ID of the Log Analytics Workspace for diagnostics."
#   type        = string
# }


