variable "name" {
  description = "(Required) The Name of the Subscription. This is the Display Name in the portal."
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) A mapping of tags which should be assigned to the Subscription."
  type        = map(any)
  default     = {}
}

variable "subscription_alias" {
  description = "(Optional) The Alias name for the subscription. Terraform will generate a new GUID if this is not supplied"
  default = null
}
variable "billing_scope_id" {
  description = "(Optional) The Azure Billing Account Scope ID"
  default = null
}
variable "workload" {
  description = "(Optional) The workload type of the Subscription. Possible values are Production (default) and DevTest"
  default = null
}