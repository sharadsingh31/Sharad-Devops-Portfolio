terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
}
# backend "azurerm" {
#     resource_group_name  = "sharad-rg"
#     storage_account_name = "sharadterraformstate"
#     container_name       = "tfstate"
#     key                  = "terraform.tfstate"
#   }
  



provider "azurerm" {
  features {}
  subscription_id = "22135bdc-d3fd-4095-9a18-2094dab79b13"
}



