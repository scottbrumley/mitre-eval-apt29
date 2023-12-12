### Hosts
# Define KVM domain to create
resource "libvirt_domain" "utica" {
  name   = "UTICA"
  memory = "4096"
  vcpu   = 2

  network_interface {
    network_name = "snet-branches" # List networks with virsh net-list
    hostname = "UTICA"
    addresses = ["10.0.1.5"]
  }

  disk {
    volume_id = "${libvirt_volume.utica-windows10-22h2-qcow2.id}"
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
output "utica-ip" {
  value = "${libvirt_domain.utica.network_interface.0.addresses.0}"
}
