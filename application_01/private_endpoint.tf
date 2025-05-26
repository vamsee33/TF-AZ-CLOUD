module "private_endpoint" {
  source                     = "../../modules/network/private_endpoint"
  name                       = var.private_endpoint_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  subnet_id                  = var.subnet_id
  tags                       = var.tags
  private_service_connection = var.private_service_connection
  private_dns_zone_group     = var.private_dns_zone_group
}
