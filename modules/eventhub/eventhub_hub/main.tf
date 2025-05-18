resource "azurerm_eventhub" "evhub" {
  name         = var.evh_object.name
  namespace_id = var.namespace_id
  # namespace_name      = var.namespace_name
  # resource_group_name      = var.resource_group
  partition_count   = var.evh_object.partition_count
  message_retention = var.evh_object.message_retention
  status            = try(var.evh_object.status, null)

  dynamic "capture_description" {
    for_each = try(var.evh_object.capture_description, false) == false ? [] : [1]
    content {
      enabled             = true
      encoding            = "Avro"
      interval_in_seconds = try(var.evh_object.capture_description.interval_in_seconds, null)
      size_limit_in_bytes = try(var.evh_object.capture_description.size_limit_in_bytes, null)
      skip_empty_archives = try(var.evh_object.capture_description.skip_empty_archives, null)

      dynamic "destination" { # required if capture_description is set
        for_each = try(var.evh_object.capture_description.destination, false) == false ? [] : [1]
        content {
          name                = "EventHubArchive.AzureBlockBlob"
          archive_name_format = "{Namespace}/{EventHub}/{PartitionId}/{Year}/{Month}/{Day}/{Hour}:{Minute}:{Second}"
          blob_container_name = var.evh_object.capture_description.destination.blob_container_name
          storage_account_id  = var.evh_object.capture_description.destination.storage_account_id
        }
      }
    }
  }
}
