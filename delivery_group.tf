resource "citrix_daas_delivery_group" "dg" {
  name = "${var.name}-dg"
  associated_machine_catalogs = [
    {
      machine_catalog = citrix_daas_machine_catalog.mc.id
      count           = 1
    }
  ]
}