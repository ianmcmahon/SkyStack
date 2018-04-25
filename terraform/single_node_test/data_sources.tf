
data "vsphere_datacenter" "dc" {
  name = "${var.esxi_datacenter}"
}

data "vsphere_datastore" "datastores" {
  count         = "${length(var.esxi_datastores)}"
  name          = "${var.esxi_datastores[count.index]}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_host" "hosts" {
  count         = "${length(var.esxi_hosts)}"
  name          = "${var.esxi_hosts[count.index]}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "${var.esxi_cluster}/${var.esxi_resourcepool}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "public" {
  name          = "${var.esxi_network}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "template" {
  name          = "${var.esxi_template}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
