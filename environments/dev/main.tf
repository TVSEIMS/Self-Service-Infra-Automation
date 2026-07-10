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
  subnet_id           = "/subscriptions/e9a23062-3783-48ff-b4a8-f7814c17bd1e/resourceGroups/rg_Infra_Automation_Dev/providers/Microsoft.Network/virtualNetworks/VNet-Infra-Automation-Dev/subnets/sent-vms-dev"
  ssh_public_key      = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDL/4Rh3+nOnCY6T5/Q9E1U2FYmbOjBIVIu96pvskXR25ncdfk0QmjwQdJHGx2ccdgGVjrcOqsbWzBBiaF4uOxXYZ6y2SO9QNq3LBJUHNJQJptP6Qd2/iMAVR6dp0ktTXBWTtfMF/BnRsZxYHTAXGwibx33bAMgwXm/GiAifL1YOXD+l7wtQpNU+9h+1RXyqFK9KI/GWfr0qkUNA651qKcG35pJUxpRoVgEvZCJFObjD2zyQKSzTpyfwhKhMdsnd77LQUVvsXn6OUa4swgutb/SPQkKW2ZZCs+51FfwBkvvxxReam9CvCv+TwZhmltDUW1CLR1zKY7rc9jFr6M+B38GwDKqeqlKrbzM6LiMBkM6moNAdgK5MEU3W37asvfLmuPHyJgQTLvZwkegO2B0pMbTYOsCnUu3enYpenQSG3EdL+JNTGUoHh/279DBxz+KDAiW51n1oRVltn4JhiOpVYOEs2k9FQr/3N1C9HC54hYRzr6fGzS2QhDt9qnvPhFleeR49bqFljT4vVocBUPO7Dfvl4D/qA2PgEu/gXHyB5bTfF/DNCF5NfelkUQMT9S5fEf5l/JVw5GdxdaR6gmbzXDUZuCM25WfHB4xAVhwzji7kO5NxQQM5XHj6oxwbXn9/b2wkod2nURkwyC1bsXBdZYfvatwlp6MPVxABj+LJFWrHw== infra-automation-rsa"
  tags = {
    environment = "dev"
    purpose     = "pipeline-test"
  }
}
