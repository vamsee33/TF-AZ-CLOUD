module "eventhub_namespace" {
  source              = "../modules/eventhub/eventhub_namespace"
  namespace_object    = var.evh_namespace
  resource_group_name = data.azurerm_resource_group.app1.name
  location            = var.location
  tags                = var.tags

}
module "namespace_auth_rules" {
  source              = "../modules/eventhub/namespace_authorization_rule"
  auth_rule_object    = var.namespace_auth_rule
  resource_group_name = data.azurerm_resource_group.app1.name
  namespace_name      = module.eventhub_namespace.name
}
module "eventhubs" {
  source       = "../modules/eventhub/eventhub_hub"
  evh_object   = var.eventhub
  namespace_id = module.eventhub_namespace.evh_id
}
module "eventhub_auth_rule" {
  source              = "../modules/eventhub/eventhub_authorization_rule"
  auth_rule_object    = var.evh_auth_rule
  namespace_name      = module.eventhub_namespace.name
  eventhub_name       = module.eventhubs.name
  resource_group_name = data.azurerm_resource_group.app1.name
}
module "consumer_groups" {
  source                = "../modules/eventhub/evh_consumer_group"
  consumer_group_object = var.consumer_group
  resource_group_name   = data.azurerm_resource_group.app1.name
  namespace_name        = module.eventhub_namespace.name
  eventhub_name         = module.eventhubs.name
}
