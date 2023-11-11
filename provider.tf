terraform {
  required_version = "~1.6.0"

  required_providers {
    citrix = {
      source  = "citrix/citrix"
      version = "0.3.2"
    }
  }
}

provider "citrix" {
  customer_id   = var.customer_id
  client_id     = var.client_id
  client_secret = var.client_secret
}
