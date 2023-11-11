terraform {
  required_version = "~> 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.80.0"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.1"
    }

    citrix = {
      source  = "citrix/citrix"
      version = ">= 0.3.2"
    }
  }
}
provider "azurerm" {
  tenant_id       = var.azure_tenant_id
  subscription_id = var.azure_subscription_id
  client_id       = var.azure_application_id
  client_secret   = var.azure_application_secret

  features {
  }
}

provider "citrix" {
  customer_id   = var.customer_id
  client_id     = var.client_id
  client_secret = var.client_secret
}
