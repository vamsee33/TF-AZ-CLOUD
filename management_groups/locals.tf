locals {
  management_groups = {
    mg_1 = {
        name = "#Name#"
        display_name = "#Name#"
        parent_management_group_id = data.azurerm_management_group.parent.id
    }
  }
}