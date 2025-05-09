## Subscription ##
resource "azurerm_subscription" "sub" {
  subscription_name = var.name
  alias             = try(var.subscription_alias, null)
  billing_scope_id  = var.billing_scope_id
  workload          = try(var.workload, null)
  tags              = try(var.tags, {})
}