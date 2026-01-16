provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_compute_instance" "windows_sql_vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "windows-server-2022-dc-v20260114"
      size  = 50
      type  = "pd-balanced"
    }
  }

  network_interface {
    network       = "default"
    access_config {} # Enables external IP
  }

  tags = ["windows-sql"]

  metadata_startup_script = <<-EOT
    winrm quickconfig -quiet
    winrm set winrm/config/client/auth @{Basic="true"}
    winrm set winrm/config/service/auth @{Basic="true"}
    winrm set winrm/config/service @{AllowUnencrypted="true"}
  EOT

  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }
}
