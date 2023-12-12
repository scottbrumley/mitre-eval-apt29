### Hosts
# Define KVM domain to create
resource "libvirt_domain" "teamserver" {
  name   = "TEAMSERVER"
  memory = "4096"
  vcpu   = 2

  network_interface {
    network_name = "snet-attacker" # List networks with virsh net-list
    hostname = "TEAMSERVER"
    addresses = ["192.168.0.4"]
  }

  disk {
    volume_id = "${libvirt_volume.teamserver-ubuntu22-04-qcow2.id}"
  }

  cloudinit = "${libvirt_cloudinit_disk.commoninit.id}"

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
}

# Output Server IP
output "teamserver-ip" {
  value = "${libvirt_domain.teamserver.network_interface.0.addresses.0}"
}
