terraform {
  backend "azurerm" {
    subscription_id      = ""
    resource_group_name  = ""
    storage_account_name = ""
    container_name       = ""
    key                  = "terraform.tfstate"
  }
  required_version = ">= 0.14"
}

provider "azurerm" {
  subscription_id = ""
  version         = "2.51.0"
  tenant_id       = ""
  features {}
}
