data "azurerm_management_group" "parent" {
  count = try(var.enabled, true) == true ? 1 : 0
  name  = "#Parent MG Name#"
}
