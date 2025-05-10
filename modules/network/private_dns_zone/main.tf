locals {
  #===========================================
  # Loathe private dns zones!!! 15 tag limit...
  #===========================================

  # First merge global and custom tags
  tags = merge(var.tags, try(var.global_settings.tags, null))
  # Limit tags to 15
  trim_tags_count = length(local.tags) > 15 ? 15 : length(local.tags)
  # Get tag keys
  map_tags = keys(local.tags)
  # Trim tag keys to first 15
  trimmed_tags_keys = slice(local.map_tags, 0, local.trim_tags_count)
  # Create map of trimmed tags to be referenced in resource
  trimmed_tags_map = try(tomap({ for k in local.trimmed_tags_keys : k => local.tags[k] }), null)
}

resource "azurerm_private_dns_zone" "private_dns" {
  name                = lower(var.settings.name)
  resource_group_name = var.resource_group_name
  tags                = local.trimmed_tags_map

  # AzureRM provider is not propogating tags properly for this resource
  # which is constantly prompting for updates every TF Plan. This is a workaround..
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}