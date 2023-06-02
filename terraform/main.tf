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
