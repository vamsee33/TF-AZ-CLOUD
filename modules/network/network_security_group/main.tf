resource "azurerm_network_security_group" "nsg_obj" {

  for_each            = var.subnets
  name                = each.value.nsg_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags

  dynamic "security_rule" {
    for_each = lookup(each.value, "nsg", [])

    content {
      name                                       = lookup(security_rule.value, "name", null)
      priority                                   = lookup(security_rule.value, "priority", null)
      direction                                  = lookup(security_rule.value, "direction", null)
      access                                     = lookup(security_rule.value, "access", null)
      protocol                                   = lookup(security_rule.value, "protocol", null)
      source_port_range                          = lookup(security_rule.value, "source_port_range", null)
      source_port_ranges                         = lookup(security_rule.value, "source_port_ranges", null)
      destination_port_range                     = lookup(security_rule.value, "destination_port_range", null)
      destination_port_ranges                    = lookup(security_rule.value, "destination_port_ranges", null)
      source_address_prefix                      = lookup(security_rule.value, "source_address_prefix", null)
      source_address_prefixes                    = lookup(security_rule.value, "source_address_prefixes", null)
      destination_address_prefix                 = lookup(security_rule.value, "destination_address_prefix", null)
      destination_address_prefixes               = lookup(security_rule.value, "destination_address_prefixes", null)
      source_application_security_group_ids      = lookup(security_rule.value, "source_application_security_group_ids ", null)
      destination_application_security_group_ids = lookup(security_rule.value, "destination_application_security_group_ids ", null)
    }
  }
}

# resource "azurerm_network_security_group" "nsg_obj" {
#   name                = module.resource_naming.name_result
#   resource_group_name = var.resource_group_name
#   location            = var.location != null ? var.location : var.global_settings.location
#   tags                = local.tags

#   dynamic "security_rule" {
#     for_each = try(var.network_security_group.rules, [])
#     content {
#       name                         = try(security_rule.value["name"], null)
#       description                  = try(security_rule.value["description"], "")
#       priority                     = try(security_rule.value["priority"], null)
#       direction                    = try(security_rule.value["direction"], null)
#       access                       = try(security_rule.value["access"], null)
#       protocol                     = try(security_rule.value["protocol"], null)
#       source_port_range            = try(security_rule.value["source_port_range"], null)
#       source_port_ranges           = try(security_rule.value["source_port_ranges"], null)
#       destination_port_range       = try(security_rule.value["destination_port_range"], null)
#       destination_port_ranges      = try(security_rule.value["destination_port_ranges"], null)
#       source_address_prefix        = try(security_rule.value["source_address_prefix"], null)
#       source_address_prefixes      = try(security_rule.value["source_address_prefixes"], null)
#       destination_address_prefix   = try(try(security_rule.value["destination_address_prefix"], null) != null ? try(security_rule.value["destination_address_prefix"], null) : try(var.destination_address_prefix[security_rule.value.ip_address_key].ip_address, null))
#       destination_address_prefixes = try(security_rule.value["destination_address_prefixes"], null)

#       # source_application_security_groups = {
#       #   keys = ["app_server"]
#       # }
#       # or
#       # source_application_security_groups = {
#       #   ids = ["resource_id"]
#       # }

#       source_application_security_group_ids = try(
#         coalescelist(
#           flatten(
#             [
#               for key in try(security_rule.value.source_application_security_groups.keys, []) : [
#                 var.application_security_groups[key].id
#               ]
#             ]
#           ),
#           flatten(
#             [
#               for asg_id in try(security_rule.value.source_application_security_groups.ids, []) : [
#                 asg_id
#               ]
#             ]
#           )
#         ),
#         []
#       )


#       # destination_application_security_groups = {
#       #   keys = ["app_server"]
#       # }
#       # or
#       # destination_application_security_groups = {
#       #   ids = ["resource_id"]
#       # }

#       destination_application_security_group_ids = try(
#         coalescelist(
#           flatten(
#             [
#               for key in try(security_rule.value.destination_application_security_groups.keys, []) : [
#                 var.application_security_groups[key].id
#               ]
#             ]
#           ),
#           flatten(
#             [
#               for asg_id in try(security_rule.value.destination_application_security_groups.ids, []) : [
#                 asg_id
#               ]
#             ]
#           )
#         ),
#         []
#       )
#     }

#   }
# }
