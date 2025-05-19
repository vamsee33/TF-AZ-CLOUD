variable "subnet_id" {
  description = "(Required) The ID of the Subnet. Changing this forces a new resource to be created."
}
variable "route_table_id" {
  description = "(Required) The ID of the Route Table which should be associated with the Subnet. Changing this forces a new resource to be created."
}
