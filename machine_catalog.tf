resource "citrix_daas_machine_catalog" "mc" {
  name                     = "${var.name}-vdi"
  zone                     = citrix_daas_zone.zone.id
  service_account          = "${var.name}-admin"
  service_account_password = random_password.password.result
  allocation_type          = "Random"
  session_support          = "SingleSession"

  provisioning_scheme = {
    machine_config = {
      hypervisor               = citrix_daas_hypervisor.hypervisor.id
      hypervisor_resource_pool = citrix_daas_hypervisor_resource_pool.resource_pool.id
      service_offering         = var.sku
      resource_group           = azurerm_resource_group.rg.name
      master_image             = azurerm_windows_virtual_machine.master.name
    }

    network_mapping = {
      network_device = "0"
      network        = azurerm_subnet.subnet.name
    }

    number_of_total_machines = 1
    machine_account_creation_rules = {
      naming_scheme      = "vdi-##"
      naming_scheme_type = "Numeric"
      domain             = var.domain
    }

    os_type           = "Windows"
    storage_type      = "Standard_LRS"
    use_managed_disks = true

    writeback_cache = {
      wbc_disk_storage_type        = "Standard_LRS"
      persist_wbc                  = true
      persist_os_disk              = true
      persist_vm                   = true
      writeback_cache_disk_size_gb = 127
      storage_cost_saving          = true
    }
  }
}