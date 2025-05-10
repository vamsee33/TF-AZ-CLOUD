# Azure Subscription Terraform Module

This Terraform module allows you to create and manage an Azure Subscription using the `azurerm_subscription` resource. It supports optional aliasing, tagging, workload type specification, and billing scope configuration.

## Features

- Creates a new Azure Subscription
- Optionally assigns an alias
- Allows tagging for resource management
- Supports specification of workload type (`Production` or `DevTest`)
- Allows linking to a billing scope

## Usage

```hcl
module "subscription" {
  source = "./path-to-this-module"

  name              = "My New Subscription"
  subscription_alias = "mysubscription-alias"
  billing_scope_id  = "/providers/Microsoft.Billing/billingAccounts/12345678"
  workload          = "Production"
  tags = {
    environment = "dev"
    owner       = "team-a"
  }
}
````

## Outputs

| Name                  | Description                                        |
| --------------------- | -------------------------------------------------- |
| `id`                  | The ID of the created subscription                 |
| `name`                | The display name of the subscription               |
| `subscription object` | The full subscription object returned by Terraform |

## Variables

| Name                 | Description                                                                  | Type       | Default |
| -------------------- | ---------------------------------------------------------------------------- | ---------- | ------- |
| `name`               | (Required) The display name of the subscription                              | `string`   | `""`    |
| `subscription_alias` | (Optional) Alias for the subscription. Terraform generates a GUID if omitted | `string`   | `null`  |
| `billing_scope_id`   | (Optional) Azure Billing Account Scope ID                                    | `string`   | `null`  |
| `workload`           | (Optional) Workload type (`Production`, `DevTest`)                           | `string`   | `null`  |
| `tags`               | (Optional) Tags to assign to the subscription                                | `map(any)` | `{}`    |

## Requirements

* Terraform >= 1.3
* AzureRM Provider >= 3.0

## Notes

* Ensure the authenticated identity has permission to create Azure subscriptions under the specified billing scope.
* Subscription creation can take several minutes.
