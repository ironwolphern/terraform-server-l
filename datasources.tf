data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = var.datacenter_id
}

data "vsphere_network" "network" {
  name          = var.network
  datacenter_id = var.datacenter_id
}

data "vsphere_virtual_machine" "template" {
  name          = var.template
  datacenter_id = var.datacenter_id
}