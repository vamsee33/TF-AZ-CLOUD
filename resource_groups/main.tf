module "resource_groups" {
  source   = "../modules/resource_group"
  for_each = local.resource_groups
  name     = each.value.name
  location = each.value.location
  tags     = try(each.value.tags, {})
}
