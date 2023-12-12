# Defining VM Volume
resource "libvirt_volume" "scranton-windows10-22h2-qcow2" {
  name = "scranton-windows10-22h2-qcow2"
  pool = "default" # List storage pools using virsh pool-list
  source = "../base_images/windows10_22H2/windows-10-22h2.qcow2"
  format = "qcow2"
}

# Defining VM Volume
resource "libvirt_volume" "nashua-windows10-22h2-qcow2" {
  name = "nashua-windows10-22h2-qcow2"
  pool = "default" # List storage pools using virsh pool-list
  source = "../base_images/windows10_22H2/windows-10-22h2.qcow2"
  format = "qcow2"
}

# Defining VM Volume
resource "libvirt_volume" "utica-windows10-22h2-qcow2" {
  name = "utica-nashua-windows10-22h2-qcow2"
  pool = "default" # List storage pools using virsh pool-list
  source = "../base_images/windows10_22H2/windows-10-22h2.qcow2"
  format = "qcow2"
}

# Defining VM Volume
resource "libvirt_volume" "newyork-windows2019-qcow2" {
  name = "newyork-windows10-qcow2"
  pool = "default" # List storage pools using virsh pool-list

  source = "../base_images/windows2019/windows-server-2019.qcow2"
format = "qcow2"
}



# Defining Linux Volumes
resource "libvirt_volume" "teamserver-ubuntu22-04-qcow2" {
  name = "teamserver-ubuntu22.04.qcow2"
  pool = "default" # List storage pools using virsh pool-list

  #source = "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2"
  #source = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"

  source = "/mnt/lab/images/noble-server-cloudimg-amd64.img"
  format = "qcow2"
}

# Defining Linux Volumes
resource "libvirt_volume" "redirector-ubuntu22-04-qcow2" {
  name = "redirector-ubuntu22.04.qcow2"
  pool = "default" # List storage pools using virsh pool-list

  #source = "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2"
  #source = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"

  source = "/mnt/lab/images/noble-server-cloudimg-amd64.img"
  format = "qcow2"
}

data "template_file" "user_data"{
  template = file("${path.module}/cloud_init.cfg")
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name           = "commoninit.iso"
  user_data      = "${data.template_file.user_data.rendered}"
  pool           = "default"
}
