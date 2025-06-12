resource "proxmox_vm_qemu" "this" {
  vmid        = var.vmid
  name        = var.name
  target_node = var.target_node

  cores  = var.cores
  memory = var.memory

  disk {
    size    = var.disk_size
    type    = var.disk_type
    storage = var.storage
    slot    = var.slot
    disk_file = var.disk_file
  }

  disk {
    type    = "cdrom"
    slot    = "ide2"
    iso     = var.iso
  }

  network {
    model    = "virtio"
    bridge   = var.bridge
    firewall = var.firewall
    id       = var.network_id
  }

  boot   = "order=ide2;scsi0"
  scsihw = "virtio-scsi-pci"
  agent  = 1
}
