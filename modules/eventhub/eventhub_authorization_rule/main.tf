resource "azurerm_eventhub_authorization_rule" "evhub_rule" {
  name                = var.settings.rule_name
  namespace_name      = var.namespace_name
  eventhub_name       = var.eventhub_name
  resource_group_name      = var.resource_group
  listen              = try(var.settings.listen, false)
  send                = try(var.settings.send, false)
  manage              = try(var.settings.manage, false)
}

output "rule_id" {
  value = azurerm_eventhub_authorization_rule.evhub_rule.id
}

output "primary_connection_string_alias" {
  value = azurerm_eventhub_authorization_rule.evhub_rule.primary_connection_string_alias
}

output "secondary_connection_string_alias" {
  value = azurerm_eventhub_authorization_rule.evhub_rule.secondary_connection_string_alias
}

output "primary_connection_string" {
  value = azurerm_eventhub_authorization_rule.evhub_rule.primary_connection_string
}

output "primary_key" {
  value = azurerm_eventhub_authorization_rule.evhub_rule.primary_key
}

output "secondary_connection_string" {
  value = azurerm_eventhub_authorization_rule.evhub_rule.secondary_connection_string
}

output "secondary_key" {
  value = azurerm_eventhub_authorization_rule.evhub_rule.secondary_key
}

variable "settings" {}
variable "resource_group" {}
variable "namespace_name" {}
variable "eventhub_name" {}