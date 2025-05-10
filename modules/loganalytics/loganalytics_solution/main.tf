resource "azurerm_log_analytics_solution" "solution" {
  for_each = var.log_analytics.solutions_maps

  solution_name         = each.name
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.workspace.id
  workspace_name        = azurerm_log_analytics_workspace.workspace.name

  plan {
    publisher      = each.value.publisher
    product        = each.value.product
    promotion_code = try(each.value.promotion_code, null)
  }
}

variable "resource_group_name" {
    description = "The resource group of the workspace."
    type = string
}

variable "location" {
    description = "The Azure region of the workspace."
    type = string
}

variable "log_analytics" {
    description = "The configuration map of the Log Analytics Solution."
    type = map(any)
}