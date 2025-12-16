terraform {
  required_version = ">=1.7.0" #terraform tool version

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.50.0"  #  AzureRM provider plugin version
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "22135bdc-d3fd-4095-9a18-2094dab79b13"
}