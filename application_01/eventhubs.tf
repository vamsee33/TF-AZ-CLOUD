module "eventhub_namespace" {
  for_each            = try(local.evh_namespaces, {})
  source              = "../modules/eventhub/eventhub_namespace"
  namespace_object    = each.value
  resource_group_name = "#RG_NAME#"
  location            = "WESTUS3"
  tags                = local.tags

}
module "namespace_auth_rules" {
  for_each            = try(local.namespace_auth_rules, {})
  source              = "../modules/eventhub/namespace_authorization_rule"
  auth_rule_object    = each.value
  resource_group_name = data.azurerm_resource_group.app1.name
  namespace_name      = module.eventhub_namespace[each.key].name
}
module "eventhubs" {
  for_each     = try(local.eventhubs, {})
  source       = "../modules/eventhub/eventhub_hub"
  evh_object   = each.value
  namespace_id = module.eventhub_namespace[each.value.namespace_key].evh_id
}
module "eventhub_auth_rule" {
  for_each            = try(local.evh_auth_rules, {})
  source              = "../modules/eventhub/eventhub_authorization_rule"
  auth_rule_object    = each.value
  namespace_name      = module.eventhub_namespace[each.value.namespace_key].name
  eventhub_name       = module.eventhubs[each.value.namespace_key].name
  resource_group_name = data.azurerm_resource_group.app1.name
}
module "consumer_groups" {
  for_each              = try(local.consumer_groups, {})
  source                = "../modules/eventhub/evh_consumer_group"
  consumer_group_object = each.value
  resource_group_name   = data.azurerm_resource_group.app1.name
  namespace_name        = module.eventhub_namespace[each.value.namespace_key].name
  eventhub_name         = module.eventhubs[each.value.evh_key].name
}
