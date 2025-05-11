module "management_group" {
  source = "../modules/management_group"
  for_each = local.management_groups
  mg_config = each.value
}