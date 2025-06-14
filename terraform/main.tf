terraform {
  backend "gcs" {
    bucket = "aifirst-terraform-state"
    prefix = "state/dev"
    
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.57.0"
    }
  }
}
provider "google" {
  project = "aifirst-restaurant"
  region  = var.region
}

#module 1 GCS
module "gcsRaw" {
  source="./GCS"
  bucket_name = "raw-bucket-aifirst-restaurant"
  location = var.region
  versioning = true
}
  
#module 2 GCS
module "gcsProcessed" {
  source="./GCS"
  bucket_name = "processed-bucket-aifirst-restaurant"
  location = var.region
  versioning = true
}

#module 3 BigQuery
module "bigquery" {
  source = "./Bigquery"
  dataset_id = "ai_first_restaurant_db"
  location = var.region
  description = "Dataset for the AI First Restaurant application"
  environment = var.environment
}

#module 4 vertex AI service account
resource "google_project_service" "vertex_ai" {
  service = "aiplatform.googleapis.com"
  
}

#module 5 Composer

#module "composer" {
#  source                = "./composer"
#  composer_name         = "aifirst-composer"
#  region                = var.region
#  environment           = "dev"
#  service_account_email = "composer-worker-sa@aifirst-restaurant.iam.gserviceaccount.com"
#}

