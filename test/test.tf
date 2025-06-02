terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.6.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.115.0"
    }
  }
}

provider "github" {
  # Configuration options
}
provider "azurerm" {
  features {

  }
  # Configuration options
}

data "github_repository" "example" {
  full_name = var.github_repository_name
}
# used rg for reference since I don't have tfe cloud
resource "azurerm_resource_group" "example" {
  name     = "${data.github_repository.example.name}-${var.deployment}"
  location = "West Europe"
}
variable "github_repository_name" {

}

variable "deployment" {
  
}
