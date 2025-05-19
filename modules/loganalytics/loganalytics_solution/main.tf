resource "azurerm_log_analytics_solution" "solution" {
  for_each = var.log_analytics.solutions_maps

  solution_name         = each.name
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = var.workspace_id
  workspace_name        = var.workspace_name

  plan {
    publisher      = each.value.publisher
    product        = each.value.product
    promotion_code = try(each.value.promotion_code, null)
  }
}
