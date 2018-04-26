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

variable "esxi_public_network" {
  type = "string"

  default = "VM Network"
}

variable "esxi_san_network" {
  type = "string"

  default = "vsan-switch"
}

variable "network_interfaces" {
  default = [
    "vmnic0",
    "vmnic1",
    "vmnic2",
    "vmnic3",
  ]
}

variable "esxi_template" {
  type = "string"
}

variable "esxi_datastores" {
  type = "list"

  default = [
    "nvmeBig - isos",    // "5a074eab-bd60820c-2fb9-782bcb35c7fa"
    "Fusion-io #7 - IAN" // "5ad9af01-01d49753-bd90-782bcb138af5"
  ]
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
