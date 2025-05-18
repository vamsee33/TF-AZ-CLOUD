resource "azurerm_eventhub_consumer_group" "evhcg" {
  name                = var.consumer_group_object.name
  namespace_name      = var.namespace_name
  eventhub_name       = var.eventhub_name
  resource_group_name = var.resource_group_name
  user_metadata       = try(var.consumer_group_object.user_metadata, null)
}
