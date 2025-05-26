module "storage_account" {
  source              = "../../modules/storage/storage_account"
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
  storage_config      = var.storage_config
}
