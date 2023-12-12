### Networks
# Define Network snet-attacker
resource "libvirt_network" "snet-attacker" {
    name = "snet-attacker"
    autostart = true
    bridge = "virbr3"
    mode = "none"
    addresses = ["192.168.0.0/24"]
    dhcp {
        enabled = false
    }
}

# Define Network snet-branches
resource "libvirt_network" "snet-branches" {
    name = "snet-branches"
    autostart = true
    bridge = "virbr1"
    mode = "none"
    addresses = ["10.0.1.0/24"]
    dhcp {
        enabled = false
    }
}

# Define Network snet-corporate-warehouse
resource "libvirt_network" "snet-corporate-warehouse" {
    name = "snet-corporate-warehouse"
    autostart = true
    bridge = "virbr2"
    mode = "none"
    addresses = ["10.0.0.0/24"]
    dhcp {
        enabled = false
    }
}
