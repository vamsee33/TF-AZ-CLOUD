## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_log_analytics_data_export_rule.export_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_data_export_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_destination_resource_id"></a> [destination\_resource\_id](#input\_destination\_resource\_id) | The destination resource ID. It should be a storage account, an event hub namespace or an event hub. If the destination is an event hub namespace, an event hub would be created for each table automatically. | `any` | n/a | yes |
| <a name="input_law_export_rule"></a> [law\_export\_rule](#input\_law\_export\_rule) | Configuration settings object for the Data export rule | `any` | n/a | yes |
| <a name="input_log_analytics_id"></a> [log\_analytics\_id](#input\_log\_analytics\_id) | Configuration settings object for the Log Analytics Workspace resource | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the resource is created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_export_rule"></a> [export\_rule](#output\_export\_rule) | All attributes of the log analytics export rule |
| <a name="output_export_rule_id"></a> [export\_rule\_id](#output\_export\_rule\_id) | The ID of the created Data Export Rule. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the created Data Export Rule. |
