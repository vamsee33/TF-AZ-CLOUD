variable "name" {
  description = "(Optional) A mapping of tags which should be assigned to the Resource Group."
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) A mapping of tags which should be assigned to the Resource Group."
  type        = map(any)
  default     = {}
}

variable "subscription_alias" {
  
}
variable "billing_scope_id" {
  
}
variable "workload" {
  
}