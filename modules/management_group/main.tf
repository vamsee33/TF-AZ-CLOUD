############################
##  Management Group
############################
resource "azurerm_management_group" "mg" {
  name                       = try(var.mg_config.name, null)
  display_name               = try(var.mg_config.display_name, null)
  parent_management_group_id = try(var.mg_config.parent_management_group_id, null)
}