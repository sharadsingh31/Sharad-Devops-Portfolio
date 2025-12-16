terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "4.50.0"
        }
    }
}

provider "azurerm" {
    features  {}
    subscription_id = "f6d438e9-6d0c-4e92-aed1-56499c5e49d0"
}