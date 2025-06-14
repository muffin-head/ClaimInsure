resource "google_storage_bucket" "main" {
  name          = var.bucket_name
  location      = var.location
  force_destroy = true

  versioning {
    enabled = var.versioning
  }
  
}