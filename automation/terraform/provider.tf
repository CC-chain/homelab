terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.2-rc01"
    }
  }
}

## Export PM_API_TOKEN_ID and PM_API_TOKEN_SECRET as environment variables
provider "proxmox" {
  # Configuration options
  pm_api_url      = "https://192.168.1.9:8006/api2/json"
  pm_tls_insecure = true
}