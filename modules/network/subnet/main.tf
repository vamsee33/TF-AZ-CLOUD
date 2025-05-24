resource "azurerm_subnet" "subnet" {

  name                                          = var.subnets.name
  resource_group_name                           = var.resource_group_name
  virtual_network_name                          = var.virtual_network_name
  address_prefixes                              = var.subnets.cidr
  service_endpoints                             = lookup(var.subnets, "service_endpoints", [])
  private_endpoint_network_policies             = lookup(var.subnets, "private_endpoint_network_policies", null)
  private_link_service_network_policies_enabled = lookup(var.subnets, "private_link_service_network_policies_enabled", null)

  dynamic "delegation" {
    for_each = lookup(var.subnets, "delegation", {}) != {} ? [1] : []
    content {
      name = lookup(var.subnets.delegation, "name", null)
      service_delegation {
        name    = lookup(var.subnets.delegation.service_delegation, "name", null)
        actions = lookup(var.subnets.delegation.service_delegation, "actions", [])
      }
    }
  }
}
