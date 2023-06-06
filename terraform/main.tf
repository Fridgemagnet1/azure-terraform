resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = random_pet.rg_name.id
}

# Remote backend
terraform {
  backend "azurerm" {
    resource_group_name = "attempt200"
    storage_account_name = "justwork1013"
    container_name = "terraformstate"
    key = "1/6dKh6lXqPNxW6mK4s73oMK2keH1ILSntCFrUjygKW5AyD4exIWs1/inFRH5flMUFzxlksva9Qf+AStW8Yyaw=="
  }
}

provider "azurerm" {
#   features {}
#   subscription_id = var.subscription_id
#   tenant_id       = var.tenant_id
#   client_id       = var.client_id
#   client_secret   = var.client_secret
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
}

data "azurerm_client_config" "current" {}
 
#Create Resource Group
resource "azurerm_resource_group" "rgsa" {
  name     = "<resourcegroup1-name>"
  location = "eastus2"
}
