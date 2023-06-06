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
    resource_group_name = "terraform-storage-rg"
    storage_account_name = "terraformstatesh123"
    container_name = "tfstatefiles"
    key = "terraform.tfstate"
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
