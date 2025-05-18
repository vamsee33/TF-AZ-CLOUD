data "azurerm_management_group" "parent" {
  count = try(var.parent_mg_enabled, true) == true ? 1 : 0
  name  = "#Parent MG Name#"
}
