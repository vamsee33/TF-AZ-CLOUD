variable "subnets" {
  description = "A configuration map of subnets deployed in a VNet."
}

variable "resource_group_name" {
  description = "The name of the resource group which holds the virtual network."
  type        = string
}
variable "location" {
  description = "(Required) Specifies the Azure location to deploy the resource. Changing this forces a new resource to be created."
  type        = string
}

variable "tags" {
  description = "(Optional) map of tags for the deployment"
  default     = {}
}
