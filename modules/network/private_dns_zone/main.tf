
resource "azurerm_private_dns_zone" "private_dns" {
  name                = var.name
  resource_group_name = var.resource_group_name
  tags                = try(var.tags, {})

  # AzureRM provider is not propogating tags properly for this resource
  # which is constantly prompting for updates every TF Plan. This is a workaround..
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
