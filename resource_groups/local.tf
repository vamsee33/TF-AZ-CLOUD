locals {
  resource_groups = {
    rg01 = {
      name     = "#Name"
      location = "#Location#"
      tags     = {}
    }
  }
}

data "azurerm_client_config" "current" {}
