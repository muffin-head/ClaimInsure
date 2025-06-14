variable "region" {
  description = "The GCP region to deploy resources in"
  type        = string
  default     = "europe-west1"
  
}
variable "environment" {
  description = "The environment for which the resources are being created (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
  
}