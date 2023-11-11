resource "citrix_daas_hypervisor" "hypervisor" {
  name                = "${var.name}-AzureRM"
  connection_type     = "AzureRM"
  zone                = citrix_daas_zone.zone.id
  active_directory_id = var.azure_tenant_id
  subscription_id     = var.azure_subscription_id
  application_secret  = var.azure_application_secret
  application_id      = var.azure_application_id
}

resource "citrix_daas_hypervisor_resource_pool" "resource_pool" {
  name                           = "${var.name}-AzureRM-Pool"
  hypervisor                     = citrix_daas_hypervisor.hypervisor.id
  region                         = var.location #azurerm_resource_group.rg.location
  virtual_network_resource_group = azurerm_virtual_network.vnet.resource_group_name
  virtual_network                = azurerm_virtual_network.vnet.name

  subnets = [azurerm_subnet.subnet.name]
}