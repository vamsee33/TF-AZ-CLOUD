module "subscriptions" {
  source             = "../modules/subscription"
  for_each           = local.mco_subscriptions
  name               = each.value.name
  subscription_alias = each.value.name
  billing_scope_id   = data.azurerm_billing_enrollment_account_scope.example.id # Hardcode a value if needed
  workload           = each.value.workload                                      #(`Production` or `DevTest`)
  tags               = each.value.tags                                          # a map of tags
}

resource "time_sleep" "wait_for_120s" {
  depends_on = [module.subscriptons]

  create_duration = "120s"
}


module "mg_sub_association" {
  depends_on          = [time_sleep.wait_for_120s]
  source              = "../modules/mg_subscription_association"
  for_each            = local.sub_associations
  management_group_id = data.azurerm_management_group.mg.id
  subscription_id     = module.subscriptions[each.value.subscription_key].id

}
