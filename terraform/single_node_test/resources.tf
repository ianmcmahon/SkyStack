
resource "vsphere_virtual_machine" "vm" {
  count = 3
  name             = "tf-${count.index}"
  host_system_id   = "${data.vsphere_host.hosts.*.id[count.index]}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastores.*.id[count.index]}"

  num_cpus = 2
  memory   = 1024
  guest_id = "ubuntu64Guest"

  network_interface {
    network_id = "${data.vsphere_network.public.id}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "tf-${count.index}"
        domain = "skypalace.local"
      }
      network_interface {}
    }
  }

  disk {
    label = "disk0"
    size  = 80
  }
}
