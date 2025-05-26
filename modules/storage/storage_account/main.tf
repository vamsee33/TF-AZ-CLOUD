resource "azurerm_storage_account" "storage" {
  name                             = var.name
  resource_group_name              = var.resource_group_name
  location                         = var.location
  tags                             = var.tags
  account_tier                     = try(var.storage_config.account_tier, "Standard")
  account_replication_type         = try(var.storage_config.account_replication_type, "LRS")
  account_kind                     = try(var.storage_config.kind, "StorageV2")
  access_tier                      = try(var.storage_config.access_tier, "Hot")
  public_network_access_enabled    = try(var.storage_config.public_network_access_enabled, true)
  min_tls_version                  = try(var.storage_config.min_tls_version, "TLS1_2")
  shared_access_key_enabled        = try(var.storage_config.shared_access_key_enabled, true)
  is_hns_enabled                   = try(var.storage_config.is_hns_enabled, false)
  allow_nested_items_to_be_public  = try(var.storage_config.allow_nested_items_to_be_public, false)
  table_encryption_key_type        = try(var.storage_config.table_encryption_key_type, null)
  queue_encryption_key_type        = try(var.storage_config.queue_encryption_key_type, null)
  cross_tenant_replication_enabled = try(var.storage_config.cross_tenant_replication_enabled, false)
  https_traffic_only_enabled       = try(var.storage_config.https_traffic_only_enabled, true)

  dynamic "custom_domain" {
    for_each = var.storage_config.custom_domain != null ? [var.storage_config.custom_domain] : []
    content {
      name          = custom_domain.value.name
      use_subdomain = lookup(custom_domain.value, "use_subdomain", null)
    }
  }

  dynamic "identity" {
    for_each = var.storage_config.identity != null ? [var.storage_config.identity] : []
    content {
      type         = identity.value.type
      identity_ids = lookup(identity.value, "identity_ids", null)
    }
  }

  dynamic "blob_properties" {
    for_each = var.storage_config.blob_properties != null ? [var.storage_config.blob_properties] : []
    content {
      versioning_enabled  = lookup(blob_properties.value, "versioning_enabled", null)
      change_feed_enabled = lookup(blob_properties.value, "change_feed_enabled", null)
      delete_retention_policy {
        days = lookup(blob_properties.value, "delete_retention_days", null)
      }
    }
  }

  dynamic "network_rules" {
    for_each = var.storage_config.network_rules != null ? [var.storage_config.network_rules] : []
    content {
      default_action             = network_rules.value.default_action
      bypass                     = lookup(network_rules.value, "bypass", null)
      ip_rules                   = lookup(network_rules.value, "ip_rules", null)
      virtual_network_subnet_ids = lookup(network_rules.value, "virtual_network_subnet_ids", null)
    }
  }

  sas_policy {
    expiration_period = "00:01:00:00" # 1 day, 0 hours, 0 minutes, 0 seconds
    expiration_action = try(var.storage_config.sas_policy_expiration_action, null)
  }
}
