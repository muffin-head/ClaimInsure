resource "google_composer_environment" "composer_env" {
  name   = var.composer_name
  region = var.region

config {
  software_config {
    image_version = "composer-2.13.1-airflow-2.10.5"
  }

  node_config {
    service_account = var.service_account_email
  }

  workloads_config {
    scheduler {
      cpu        = 0.5
      memory_gb  = 1
      storage_gb = 1
      count      = 1
    }
    web_server {
      cpu        = 0.5
      memory_gb  = 1
      storage_gb = 1
    }
    worker {
      cpu        = 0.5
      memory_gb  = 1
      storage_gb = 1
      min_count  = 1
      max_count  = 1
    }
  }
}





  labels = {
    environment = var.environment
  }
}



