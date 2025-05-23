## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_eventhub.evhub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_evh_object"></a> [evh\_object](#input\_evh\_object) | n/a | `any` | n/a | yes |
| <a name="input_namespace_id"></a> [namespace\_id](#input\_namespace\_id) | Name of the Event Hub Namespace. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_hub_id"></a> [hub\_id](#output\_hub\_id) | The ID of the EventHub. |
| <a name="output_name"></a> [name](#output\_name) | The name of the EventHub. |
