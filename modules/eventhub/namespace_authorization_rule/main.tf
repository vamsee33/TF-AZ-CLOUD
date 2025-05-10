resource "azurerm_eventhub_namespace_authorization_rule" "evh_ns_rule" {
  name                = var.settings.rule_name
  namespace_name      = var.namespace_name
  resource_group_name = var.resource_group
  listen              = var.settings.listen
  send                = var.settings.send
  manage              = var.settings.manage
}

variable "settings" {}
variable "resource_group" {}
variable "namespace_name" {}