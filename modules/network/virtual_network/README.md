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
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ddos_enabled"></a> [ddos\_enabled](#input\_ddos\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_ddos_id"></a> [ddos\_id](#input\_ddos\_id) | (Optional) ID of the DDoS protection plan if exists | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the Azure location to deploy the resource. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_networking_object"></a> [networking\_object](#input\_networking\_object) | (Required) configuration object describing the networking configuration, as described in README | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) Name of the resource group where to create the resource. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) map of tags for the deployment | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_address_space"></a> [address\_space](#output\_address\_space) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
