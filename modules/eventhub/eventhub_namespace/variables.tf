variable "namespace_object" {}
variable "resource_group_name" {}
variable "location" {}
variable "tags" {
  default = {}
}
variable "network_rulesets" {
  type = list(object({
    default_action                 = string
    trusted_service_access_enabled = bool
    public_network_access_enabled  = bool

    ip_rules = list(object({
      ip_mask = string
      action  = string
    }))

  }))
  default = [{}]
}
