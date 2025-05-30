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
| [azurerm_network_ddos_protection_plan.resource](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_ddos_protection_plan) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where to create the resource. Ommitting this variable will default to the var.global\_settings.location value. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The Name of the DDoS Plan | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the resource is created | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Custom tags for the resource | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the DDoS Protection Plan |
| <a name="output_name"></a> [name](#output\_name) | The Name of the DDoS Protection Plan |
| <a name="output_virtual_network_ids"></a> [virtual\_network\_ids](#output\_virtual\_network\_ids) | A list of Virtual Network IDs associated with the DDoS Protection Plan |
