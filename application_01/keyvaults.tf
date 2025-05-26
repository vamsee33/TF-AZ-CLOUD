module "key_vault" {
  source                   = "../modules/key_vault"
  name                     = var.key_vault_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  sku_name                 = try(var.key_vault_sku_name, "standard")
  tenant_id                = var.tenant_id
  soft_delete_enabled      = try(var.key_vault_soft_delete_enabled, true)
  purge_protection_enabled = try(var.key_vault_purge_protection_enabled, false)
  access_policies          = try(var.key_vault_access_policies, [])
  network_acls             = try(var.key_vault_network_acls, null)
}
