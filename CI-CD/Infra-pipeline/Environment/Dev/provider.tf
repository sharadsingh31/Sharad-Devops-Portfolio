terraform {
  required_version = ">=1.6.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.55.0"
    }
  }

 backend "azurerm" {
    resource_group_name  = "Singh-RG-Pipeline"
    storage_account_name = "singhstgpipeline"
    container_name       = "singhcontainerpipeline"
    key                  = "devterraform.tfstate"
  }
}
provider "azurerm" {
  features {}
  subscription_id = "22135bdc-d3fd-4095-9a18-2094dab79b13"

}
