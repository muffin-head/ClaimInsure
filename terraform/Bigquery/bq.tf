resource "google_bigquery_dataset" "main" {
    dataset_id = var.dataset_id
    location   = var.location
    friendly_name = "Restaurant Dataset"
    description   = "Dataset for the AI First Restaurant application"
    
    labels = {
        environment = var.environment
    }  
}