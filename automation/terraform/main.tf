module "k8s_control_plane" {
  source = "./modules/vm"

  vmid        = 101
  name        = "k8s-control-plane"
  target_node = "proxmox"
  cores       = 2
  sockets     = 1
  memory      = 4096
  disk_size   = "100G"
  disk_type   = "disk"
  disk_file   = "local-lvm:vm-100-disk-0" 
  storage     = "local-lvm"
  iso         = "local:iso/rhel-9.5-x86_64-dvd.iso"
  bridge      = "vmbr0"
  firewall    = true
  slot        = "scsi0"
  network_id  = 0
}