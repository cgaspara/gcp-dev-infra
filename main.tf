provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "lab_bucket" {
  name          = var.bucket_name
  location      = var.region
  storage_class = "STANDARD"
  force_destroy = true
}

