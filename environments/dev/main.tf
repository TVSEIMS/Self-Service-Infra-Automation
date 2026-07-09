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

module "test_vm" {
  source              = "../../modules/vm"
  vm_name             = "test-vm-01"
  vm_size             = "Standard_B1s"
  resource_group_name = data.azurerm_resource_group.existing.name
  location            = data.azurerm_resource_group.existing.location
  subnet_id           = "e9a23062-3783-48ff-b4a8-f7814c17bd1e"
  ssh_public_key      = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBhkqLmUe0VBhAaRBqxJwQ2TDE7r6pSf91VpFmbh2EY+ infra-automation"
  tags = {
    environment = "dev"
    purpose     = "pipeline-test"
  }
}
