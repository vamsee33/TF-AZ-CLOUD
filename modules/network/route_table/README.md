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
| [azurerm_route_table.route_table](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Location where to create the resource | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group where to create the resource | `any` | n/a | yes |
| <a name="input_route_table"></a> [route\_table](#input\_route\_table) | A route table map object to be created. | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags for the deployment. | `any` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Returns the ID of the created route table |
| <a name="output_name"></a> [name](#output\_name) | Returns the name of the created route table |
| <a name="output_route_table_obj"></a> [route\_table\_obj](#output\_route\_table\_obj) | Returns the full object of the created route table |
