terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg_Infra_Automation_Dev"
    storage_account_name = "tvseinfradev"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

data "azurerm_resource_group" "existing" {
  name = "rg_Infra_Automation_Dev"
}

resource "azurerm_storage_account" "test" {
  name                     = "tvsesttfteststorage04"   # must be globally unique, all lowercase
  resource_group_name      = data.azurerm_resource_group.existing.name
  location                 = data.azurerm_resource_group.existing.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
