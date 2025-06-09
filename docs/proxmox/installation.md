# 🖥️ Proxmox Installation Guide

This guide walks you through setting up **Proxmox VE** (Virtual Environment) from scratch, including bootable USB creation, installation, networking, and post-install cleanup.

---

## ✅ 1. Download the Proxmox ISO

- Visit the official [Proxmox ISO download page](https://www.proxmox.com/en/downloads/proxmox-virtual-environment/iso).
- Download the latest stable version of **Proxmox VE ISO Installer**.

> ℹ️ This ISO will be used to install the Proxmox hypervisor on your physical machine.

---

## ✅ 2. Create a Bootable USB Drive

- Download and install [**balenaEtcher**](https://etcher.balena.io/).
- Use Etcher to flash the downloaded ISO onto your USB stick.

> 🔧 Etcher is a simple, cross-platform tool for writing images to USB drives safely and reliably.

---

## ✅ 3. Prepare Your PC for Installation

Before booting into the installer:
- 🔒 **Disable Secure Boot** in your BIOS settings.
  - Secure Boot blocks unsigned operating systems like Proxmox.
- Set USB as the **first boot device**.

---

## ✅ 4. Install Proxmox VE

- Boot into the USB installer and follow the guided installation.
- Choose the **target disk** where you want Proxmox installed.

---

## ✅ 5. Choose the Right Filesystem

- If you have **multiple drives** and want redundancy → select **ZFS**.
  - ZFS supports mirroring, snapshots, and self-healing.
- If you have **a single SSD/HDD** → use **XFS**.
  - XFS is fast and well-suited for large file operations.

> 💡 Choose based on your **hardware and reliability needs**.

---

## ✅ 6. Configure Static IP Properly

When assigning a static IP during installation:
- Ensure the IP is in the **same subnet as your router**.
  - Example: if your router is `192.168.1.1`, your Proxmox could be `192.168.1.100`.
- Avoid IP conflicts — **make sure the IP isn’t already in use**.
- Optionally, configure a DHCP reservation on your router.

> ❗ Incorrect subnet/gateway setup can lead to inaccessible Proxmox UI after install.

---

## ✅ 7. Access the Proxmox Web UI

Once the installation is complete:
- Open a browser on another machine.
- Navigate to: "https://xx.xx.xx.xx:8006"

## ✅ 8. Remove the “No Valid Subscription” Popup (Optional)

Proxmox is free to use, but nags you about missing a subscription.

To remove the popup:

```bash
sudo vi /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js
```
Search for and comment/remove the line that triggers the popup (starts with Ext.Msg.show...)

## ✅ 9. Get Rid Of Enterprise Repository (Optional)

- First disable those repositories. 
- Add "Ceph Reef No-Subscription" as repository.
- Go To Update section and refresh the packages. 
- After that you can upgrade the packages with new non-subscribed repository.
