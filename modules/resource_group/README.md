# Azure Resource Group Module

This Terraform module provisions an Azure Resource Group.

## Features

- Creates an Azure Resource Group
- Supports custom tags
- Exposes common output values

## Usage

```hcl
module "resource_group" {
  source  = "./path-to-your-module"

  name     = "my-resource-group"
  location = "East US"
  tags = {
    environment = "dev"
    owner       = "platform-team"
  }
}
````

## Variables

| Name       | Type       | Description                                                                 |
| ---------- | ---------- | --------------------------------------------------------------------------- |
| `name`     | `string`   | **(Required)** The name of the Resource Group.                              |
| `location` | `string`   | **(Required)** The Azure region in which to create the Resource Group.      |
| `tags`     | `map(any)` | (Optional) A map of tags to assign to the Resource Group. Defaults to `{}`. |

## Outputs

| Name   | Description                     |
| ------ | ------------------------------- |
| `id`   | The ID of the Resource Group.   |
| `name` | The name of the Resource Group. |

## Requirements

