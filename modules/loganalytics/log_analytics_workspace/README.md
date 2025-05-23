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
| [azurerm_log_analytics_workspace.law](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_log_analytics_workspace_settings"></a> [log\_analytics\_workspace\_settings](#input\_log\_analytics\_workspace\_settings) | } | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Common tags for all resources | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#output\_log\_analytics\_workspace\_id) | IDs of Log Analytics Workspace |
| <a name="output_log_analytics_workspace_primary_key"></a> [log\_analytics\_workspace\_primary\_key](#output\_log\_analytics\_workspace\_primary\_key) | Primary Shared Keys of Log Analytics Workspace |
| <a name="output_log_analytics_workspace_secondary_key"></a> [log\_analytics\_workspace\_secondary\_key](#output\_log\_analytics\_workspace\_secondary\_key) | Secondary Shared Keys of Log Analytics Workspace |
