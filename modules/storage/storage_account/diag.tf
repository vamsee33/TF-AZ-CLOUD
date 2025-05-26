# # Single data block to get diagnostic categories for storage account and all subresources

# data "azurerm_monitor_diagnostic_categories" "all" {
#   for_each = toset([
#     azurerm_storage_account.this.id,
#     "${azurerm_storage_account.this.id}/blobServices/default",
#     "${azurerm_storage_account.this.id}/fileServices/default",
#     "${azurerm_storage_account.this.id}/queueServices/default",
#     "${azurerm_storage_account.this.id}/tableServices/default"
#   ])
#   resource_id = each.value
# }

# # Merge all resource IDs and categories for diagnostics
# locals {
#   all_diag_targets = merge(
#     { storage = azurerm_storage_account.this.id },
#     { for k, v in {
#       blob  = "${azurerm_storage_account.this.id}/blobServices/default"
#       file  = "${azurerm_storage_account.this.id}/fileServices/default"
#       queue = "${azurerm_storage_account.this.id}/queueServices/default"
#       table = "${azurerm_storage_account.this.id}/tableServices/default"
#     } : k => v }
#   )
# }

# resource "azurerm_monitor_diagnostic_setting" "all" {
#   for_each                   = local.all_diag_targets
#   name                       = "diag-${each.key}"
#   target_resource_id         = each.value
#   log_analytics_workspace_id = var.log_analytics_workspace_id

#   dynamic "log" {
#     for_each = try([for cat in data.azurerm_monitor_diagnostic_categories.all[each.value].log_category_types : cat], [])
#     content {
#       category = log.value
#       enabled  = true
#     }
#   }

#   dynamic "metric" {
#     for_each = try([for cat in data.azurerm_monitor_diagnostic_categories.all[each.value].metric_category_types : cat], [])
#     content {
#       category = metric.value
#       enabled  = true
#     }
#   }
# }
