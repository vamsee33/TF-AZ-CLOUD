resource "azurerm_eventhub" "evhub" {
  name                =  var.settings.name
  namespace_name      = var.namespace_name
  resource_group_name      = var.resource_group
  partition_count     = var.settings.partition_count
  message_retention   = var.settings.message_retention
  status              = try(var.settings.status, null)

  dynamic "capture_description" {
    for_each = try(var.settings.capture_description, false) == false ? [] : [1]
    content {
      enabled  = true
      encoding = "Avro"
      interval_in_seconds = try(var.settings.capture_description.interval_in_seconds, null)
      size_limit_in_bytes = try(var.settings.capture_description.size_limit_in_bytes, null)
      skip_empty_archives = try(var.settings.capture_description.skip_empty_archives, null)

      dynamic "destination" { # required if capture_description is set
        for_each = try(var.settings.capture_description.destination, false) == false ? [] : [1]
        content {
          name                = "EventHubArchive.AzureBlockBlob"
          archive_name_format = "{Namespace}/{EventHub}/{PartitionId}/{Year}/{Month}/{Day}/{Hour}:{Minute}:{Second}"
          blob_container_name = var.settings.capture_description.destination.blob_container_name
          storage_account_id = var.settings.capture_description.destination.storage_account_id
        }
      }
    }
  }
}

output "hub_id" {
  description = "The ID of the EventHub."
  value       = azurerm_eventhub.evhub.id
}

output "name" {
  description = "The name of the EventHub."
  value       = azurerm_eventhub.evhub.name
}

variable "settings" {}
variable "resource_group" {}
variable "namespace_name" {
  description = "Name of the Event Hub Namespace."
  type        = string
}