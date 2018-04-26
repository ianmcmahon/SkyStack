provider "vsphere" {
  version = "~> 1.1"
  user = "${var.esxi_username}"
  password = "${var.esxi_password}"
  vsphere_server = "${var.esxi_vsphere_host}"
  allow_unverified_ssl = true
}
