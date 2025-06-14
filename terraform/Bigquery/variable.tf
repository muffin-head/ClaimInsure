variable "dataset_id" {
  description = "The ID of the BigQuery dataset"
  type        = string
  
}

variable "location" {
  description = "The location of the BigQuery dataset"
  type        = string
  
}
variable "description" {
  description = "A description of the BigQuery dataset"
  type        = string
  default     = "Dataset for the AI First Restaurant application"   
  
}
variable "environment" {
  description = "The environment for which the dataset is being created (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
    
}