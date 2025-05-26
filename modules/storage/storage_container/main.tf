resource "azurerm_storage_container" "this" {
  name                     = var.name
  storage_account_name     = var.storage_account_name
  container_access_type    = try(var.container_access_type, null)
  metadata                 = try(var.metadata, null)
  default_encryption_scope = var.default_encryption_scope
}
