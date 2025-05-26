resource "azurerm_key_vault" "vault" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id
  sku_name            = var.sku_name
  #   soft_delete_enabled         = var.soft_delete_enabled
  # soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled = var.purge_protection_enabled
  access_policy            = var.access_policies

  dynamic "network_acls" {
    for_each = var.network_acls != null ? [var.network_acls] : []
    content {
      bypass                     = lookup(network_acls.value, "bypass", "AzureServices")
      default_action             = lookup(network_acls.value, "default_action", "Allow")
      ip_rules                   = lookup(network_acls.value, "ip_rules", null)
      virtual_network_subnet_ids = lookup(network_acls.value, "virtual_network_subnet_ids", null)
    }
  }
}
