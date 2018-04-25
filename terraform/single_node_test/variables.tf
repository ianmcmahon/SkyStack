variable "esxi_datacenter" {
  type = "string"

  default = "SkyPalace"
}

variable "esxi_cluster" {
  type = "string"

  default = "SkyCluster"
}

variable "esxi_resourcepool" {
  type = "string"

  default = "Resources"
}

variable "esxi_hosts" {
  type = "list"

  default = ["192.168.1.25", "192.168.1.26"]
}

variable "esxi_network" {
  type = "string"

  default = "VM Network"
}

variable "esxi_template" {
  type = "string"
}

variable "esxi_datastores" {
  type = "list"

  default = ["Fusioni-io #4 - fct2", "Fusion-io #7 - IAN"]
}

variable "esxi_username" {
  type = "string"
  
  default = "administrator@vsphere.local"
}

variable "esxi_password" {
  type = "string"
}

variable "esxi_vsphere_host" {
  type = "string"
}
