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
| [azurerm_eventhub_namespace.evh](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | n/a | `any` | n/a | yes |
| <a name="input_namespace_object"></a> [namespace\_object](#input\_namespace\_object) | n/a | `any` | n/a | yes |
| <a name="input_network_rulesets"></a> [network\_rulesets](#input\_network\_rulesets) | n/a | <pre>list(object({<br/>    default_action                 = string<br/>    trusted_service_access_enabled = bool<br/>    public_network_access_enabled  = bool<br/><br/>    ip_rules = list(object({<br/>      ip_mask = string<br/>      action  = string<br/>    }))<br/><br/>  }))</pre> | <pre>[<br/>  {}<br/>]</pre> | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_evh_id"></a> [evh\_id](#output\_evh\_id) | The EventHub Namespace ID. |
| <a name="output_evh_obj"></a> [evh\_obj](#output\_evh\_obj) | The EventHub Namespace ID. |
| <a name="output_name"></a> [name](#output\_name) | The EventHub Namespace name. |
