resource "vsphere_virtual_machine" "vm_l" {
  count                   = var.instance_count
  name                    = format("SV${var.name}%02d", count.index+1)
  folder                  = var.folder
  firmware                = "efi" # must match template vm setting
  efi_secure_boot_enabled = true
  resource_pool_id        = var.resource_pool_id
  datastore_id            = data.vsphere_datastore.datastore.id

  num_cpus  = var.num_cpu
  memory    = var.memory
  guest_id  = data.vsphere_virtual_machine.template.guest_id
  
  wait_for_guest_net_timeout  = "0"
  wait_for_guest_net_routable = "false"

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = var.disk_size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = format("SV${var.name}%02d", count.index+1)
        domain    = var.Domain
      }

      network_interface {
        ipv4_address = var.ip
        ipv4_netmask = var.Netmask
      }

      dns_server_list = var.DNS
      dns_suffix_list = var.list_Domain
      ipv4_gateway    = var.Gateway
    }
  }
}