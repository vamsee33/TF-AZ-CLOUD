module "key_vault" {
  source                   = "../modules/security/key_vault"
  name                     = var.key_vault_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  sku_name                 = try(var.key_vault_sku_name, "standard")
  tenant_id                = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days = try(var.key_vault_soft_delete_retention_days, 90)
  purge_protection_enabled = try(var.key_vault_purge_protection_enabled, false)
  enable_rbac_authorization = try(var.key_vault_enable_rbac_authorization, false)
  enabled_for_deployment   = try(var.key_vault_enabled_for_deployment, false)
  enabled_for_disk_encryption = try(var.key_vault_enabled_for_disk_encryption, false)
  enabled_for_template_deployment = try(var.key_vault_enabled_for_template_deployment, false)
  tags                     = try(var.tags, {})

  access_policies          = try(var.key_vault_access_policies, [])
  network_acls             = try(var.key_vault_network_acls, null)
}
