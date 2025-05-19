# Azure Management Group Module

This Terraform module creates an Azure Management Group and allows optional configuration through input variables.

## Features

- Creates an Azure Management Group
- Supports optional values for name, display name, and parent group
- Uses safe defaults to avoid errors when variables are not set

## Usage

```hcl
module "management_group" {
  source = "./path-to-your-module"

  mg_config = {
    name                       = "my-management-group"
    display_name               = "My Management Group"
    parent_management_group_id = "00000000-0000-0000-0000-000000000000"
  }
}
````

> All fields are optional. You can omit `mg_config` entirely if needed.

## Variables

| Name       | Type     | Default | Description                              |
| ---------- | -------- | ------- | ---------------------------------------- |
| mg\_config | `object` | `{}`    | Optional management group configuration. |

### `mg_config` object supports:

* `name` – (Optional) The name of the management group.
* `display_name` – (Optional) The display name of the management group.
* `parent_management_group_id` – (Optional) The parent management group ID.

## Outputs

| Name               | Description                                |
| ------------------ | ------------------------------------------ |
| `id`               | The ID of the management group.            |
| `name`             | The name of the management group.          |
| `display_name`     | The display name of the management group.  |
| `management_group` | The full management group resource object. |

## Requirements

