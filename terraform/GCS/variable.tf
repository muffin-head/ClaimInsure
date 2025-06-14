variable "bucket_name" {
  description = "The name of the GCS bucket to create"
  type        = string
  
}
variable "location" {
  description = "The location for the GCS bucket"
  type        = string  
  
}
variable "versioning" {
  description = "Enable versioning for the GCS bucket"
  type        = bool
  default     = false
  
}