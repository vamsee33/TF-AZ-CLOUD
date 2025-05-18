variable "consumer_group_object" {}

variable "resource_group_name" {
  description = "Resource group name."
}

variable "namespace_name" {
  description = "Name of the Event Hub Namespace."
  type        = string
}

variable "eventhub_name" {
  description = "Name of the Event Hub."
  type        = string
}
