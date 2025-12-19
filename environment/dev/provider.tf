terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.51.0"
    }
  }
  
  backend "azurerm" {
    resource_group_name  = ""
    storage_account_name = ""
    container_name       = "tfstate"
    key                  = ""
  }

}


provider "azurerm" {
  features {}
  subscription_id = "3d1ce785-6c4d-4565-bb5e-3b46939260a6"
}
