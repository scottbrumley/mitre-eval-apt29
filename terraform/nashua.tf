### Hosts
# Define KVM domain to create
resource "libvirt_domain" "nashua" {
  name   = "NASHUA"
  memory = "4096"
  vcpu   = 2

  network_interface {
    network_name = "snet-branches" # List networks with virsh net-list
    hostname = "NASHUA"
    addresses = ["10.0.1.6"]
  }

  disk {
    volume_id = "${libvirt_volume.nashua-windows10-22h2-qcow2.id}"
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
output "nashua-ip" {
  value = "${libvirt_domain.nashua.network_interface.0.addresses.0}"
}
