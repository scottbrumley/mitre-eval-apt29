### Hosts
# Define KVM domain to create
resource "libvirt_domain" "newyork" {
  name   = "NEWYORK"
  memory = "4096"
  vcpu   = 2

  network_interface {
    network_name = "snet-corporate-warehouse" # List networks with virsh net-list
    hostname = "NEWYORK"
    addresses = ["10.0.0.4"]
  }

  disk {
    volume_id = "${libvirt_volume.newyork-windows2019-qcow2.id}"
  }

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }

  xml {
    xslt = file("tablet.xsl")
  }

}

# Output Server IP
output "newyork-ip" {
  value = "${libvirt_domain.newyork.network_interface.0.addresses.0}"
}
