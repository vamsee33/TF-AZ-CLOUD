terraform {
  required_version = ">= 1.1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
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
  skip_provider_registration = true
}
