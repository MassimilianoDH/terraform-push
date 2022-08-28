##### config #####
##################

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.19.1"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate12345"
    container_name       = "tfstate"
    key                  = "states.example-group.terraform.tfstate"
  }
}