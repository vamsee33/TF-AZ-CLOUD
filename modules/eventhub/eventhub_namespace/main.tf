resource "azurerm_eventhub_namespace" "evh" {
  name                     = var.settings.name
  location                 = var.location
  resource_group_name      = var.resource_group
  sku                      = var.settings.sku
  capacity                 = try(var.settings.capacity, null)
  tags                     = var.tags
  auto_inflate_enabled     = try(var.settings.auto_inflate_enabled, null)
  dedicated_cluster_id     = try(var.settings.dedicated_cluster_id, null)
  maximum_throughput_units = try(var.settings.maximum_throughput_units, null)
#   zone_redundant           = try(var.settings.zone_redundant, null)
  public_network_access_enabled = try(var.settings.public_network_access_enabled, false)

  dynamic "identity" {
    for_each = try(var.settings.identity, {})
    content {
      type = identity.value.type
    }
  }

  dynamic "network_rulesets" {
    for_each = var.network_rulesets
    content {
      default_action                 = lookup(network_rulesets.value, "default_action", null)  #Possible values are Allow and Deny. Defaults to Deny.
      trusted_service_access_enabled = lookup(network_rulesets.value, "trusted_service_access_enabled", true)
      public_network_access_enabled  = lookup(network_rulesets.value, "public_network_access_enabled", false)

      dynamic "ip_rule" {
        for_each = network_rulesets.value.ip_rules #can(network_rulesets.value["ip_rules"]) ? [] : network_rulesets.value["ip_rules"]
        content {
          ip_mask = lookup(ip_rule.value, "ip_mask", null) #ip_rule.value["ip_mask"]
          action  = lookup(ip_rule.value, "action", "Allow") #coalesce(ip_rule.value["action"], "Allow")
        }
      }

      dynamic "virtual_network_rule" {
        for_each = try(var.settings.network_rulesets.virtual_network_rule, {}) #can(network_rulesets.value["virtual_network_rules"]) ? [] : network_rulesets.value["virtual_network_rules"]
        content {
          subnet_id                                       = virtual_network_rule.value.subnet_id #coalesce(virtual_network_rule.value["subnet_id"], null)
          ignore_missing_virtual_network_service_endpoint = try(virtual_network_rule.value.ignore_missing_virtual_network_service_endpoint, null) #coalesce(virtual_network_rule.value["ignore_missing_virtual_network_service_endpoint"], false)
        }
      }
      
    }
  }
}