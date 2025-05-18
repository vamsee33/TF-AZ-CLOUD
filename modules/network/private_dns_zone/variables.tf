variable "resource_group_name" {
  description = "(Required) Name of the resource group where to create the resource. Changing this forces a new resource to be created. "
  type        = string
}

variable "name" {
  description = "(Required) Specifies the Name of Private DNS Zone NAME. Changing this forces a new resource to be created."
  type        = string
}

variable "tags" {
  description = "(Optional) map of tags for the deployment"
  default     = {}
}


# locals {
#   #===========================================
#   # Loathe private dns zones!!! 15 tag limit...
#   #===========================================

#   # First merge global and custom tags
#   tags = merge(var.tags, try(var.global_settings.tags, null))
#   # Limit tags to 15
#   trim_tags_count = length(local.tags) > 15 ? 15 : length(local.tags)
#   # Get tag keys
#   map_tags = keys(local.tags)
#   # Trim tag keys to first 15
#   trimmed_tags_keys = slice(local.map_tags, 0, local.trim_tags_count)
#   # Create map of trimmed tags to be referenced in resource
#   trimmed_tags_map = try(tomap({ for k in local.trimmed_tags_keys : k => local.tags[k] }), null)
# }
