output "bucket_name" {
  description = "The name of the GCS bucket created for the restaurant application."
  value       = google_storage_bucket.main.name
  
}
output "bucket_url" {
  description = "The URL of the GCS bucket created for the restaurant application."
  value       = "gs://${google_storage_bucket.main.name}"
  
}