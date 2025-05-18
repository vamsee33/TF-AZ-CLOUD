resource "azurerm_eventhub_authorization_rule" "evhub_rule" {
  name                = var.auth_rule_object.rule_name
  namespace_name      = var.namespace_name
  eventhub_name       = var.eventhub_name
  resource_group_name = var.resource_group_name
  listen              = try(var.auth_rule_object.listen, false)
  send                = try(var.auth_rule_object.send, false)
  manage              = try(var.auth_rule_object.manage, false)
}
