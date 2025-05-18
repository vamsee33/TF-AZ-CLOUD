resource "azurerm_subnet_route_table_association" "rt_vnet_association" {

  subnet_id      = var.subnet_id
  route_table_id = var.route_table_id

  timeouts {
    create = "1h"
    delete = "1h"
  }
}
