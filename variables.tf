variable "customer_id" {
  type        = string
  description = "The Citrix Cloud customer id"
}

variable "client_id" {
  type        = string
  description = "The Citrix Cloud client id"
}

variable "client_secret" {
  type        = string
  description = "The Citrix Cloud client secret"
}

variable "name" {
  type        = string
  default     = "GO"
  description = "The name that will be used to create the resources"
}

variable "domain" {
  type        = string
  description = "The fqdn domain name"
  default     = "go.euc"
}

variable "location" {
  type        = string
  description = "The Azure location"
  default     = "West Europe"
}

variable "sku" {
  type        = string
  description = "The Azure SKU type for the master and Citrix machine catalog"
  default     = "Standard_D4s_v5"
}

variable "azure_tenant_id" {
  type        = string
  description = "The Azure Tenant ID"
}

variable "azure_subscription_id" {
  type        = string
  description = "The Azure Subscription ID"
}

variable "azure_application_secret" {
  type        = string
  description = "The Azure Application Secret"
}

variable "azure_application_id" {
  type        = string
  description = "The Azure Application ID"
}
