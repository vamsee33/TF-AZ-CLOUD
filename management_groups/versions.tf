terraform {
  required_version = ">= 1.1.0"  # update if needed
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
  cloud {
    organization = "##organization_name##"
    workspaces {
      name = "##workspace##"
    }
  }
}

provider "azurerm" {
  features {}
}