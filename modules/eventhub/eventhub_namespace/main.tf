resource "azurerm_eventhub_namespace" "evh" {
  name                     = var.namespace_object.name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  sku                      = var.namespace_object.sku
  capacity                 = try(var.namespace_object.capacity, null)
  tags                     = var.tags
  auto_inflate_enabled     = try(var.namespace_object.auto_inflate_enabled, null)
  dedicated_cluster_id     = try(var.namespace_object.dedicated_cluster_id, null)
  maximum_throughput_units = try(var.namespace_object.maximum_throughput_units, null)
  #   zone_redundant           = try(var.namespace_object.zone_redundant, null)
  public_network_access_enabled = try(var.namespace_object.public_network_access_enabled, false)

  dynamic "identity" {
    for_each = try(var.namespace_object.identity, {})
    content {
      type = identity.value.type
    }
  }

  dynamic "network_rulesets" {
    for_each = try(var.network_rulesets, {})
    content {
      default_action                 = lookup(network_rulesets.value, "default_action", null) #Possible values are Allow and Deny. Defaults to Deny.
      trusted_service_access_enabled = lookup(network_rulesets.value, "trusted_service_access_enabled", true)
      public_network_access_enabled  = lookup(network_rulesets.value, "public_network_access_enabled", false)

      dynamic "ip_rule" {
        for_each = network_rulesets.value.ip_rules #can(network_rulesets.value["ip_rules"]) ? [] : network_rulesets.value["ip_rules"]
        content {
          ip_mask = lookup(ip_rule.value, "ip_mask", null)   #ip_rule.value["ip_mask"]
          action  = lookup(ip_rule.value, "action", "Allow") #coalesce(ip_rule.value["action"], "Allow")
        }
      }

      dynamic "virtual_network_rule" {
        for_each = try(var.namespace_object.network_rulesets.virtual_network_rule, {}) #can(network_rulesets.value["virtual_network_rules"]) ? [] : network_rulesets.value["virtual_network_rules"]
        content {
          subnet_id                                       = virtual_network_rule.value.subnet_id                                                  #coalesce(virtual_network_rule.value["subnet_id"], null)
          ignore_missing_virtual_network_service_endpoint = try(virtual_network_rule.value.ignore_missing_virtual_network_service_endpoint, null) #coalesce(virtual_network_rule.value["ignore_missing_virtual_network_service_endpoint"], false)
        }
      }

    }
  }
}
