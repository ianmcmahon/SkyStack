resource "vsphere_distributed_virtual_switch" "dvs" {
  name          = "${var.esxi_san_network}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
  
  host {
    host_system_id  = "${data.vsphere_host.host.0.id}"
    devices         = ["${var.network_interfaces[3]}"] 
  }

  host {
    host_system_id  = "${data.vsphere_host.host.1.id}"
    devices         = ["${var.network_interfaces[3]}"] 
  }
}

resource "vsphere_distributed_port_group" "pg" {
  name                            = "san-pg"
  distributed_virtual_switch_uuid = "${vsphere_distributed_virtual_switch.dvs.id}"
}

resource "vsphere_virtual_machine" "vm" {
  count = 2
  name             = "vsan-${count.index + 1}"
  host_system_id   = "${data.vsphere_host.host.*.id[count.index]}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastores.*.id[count.index]}"

  num_cpus = 1
  memory   = 16384
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  network_interface {
    network_id = "${data.vsphere_network.public.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  network_interface {
    network_id = "${vsphere_distributed_port_group.pg.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "vsan-${count.index + 1}"
        domain = "skypalace.local"
      }
      network_interface {}
      network_interface {
        ipv4_address = "10.10.10.35"
        ipv4_netmask = 24
      }
    }
  }

  disk {
    label = "disk0"
    size  = "${data.vsphere_virtual_machine.template.disks.0.size}"
  }
}
