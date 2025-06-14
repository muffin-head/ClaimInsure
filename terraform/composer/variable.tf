variable "composer_name" {
  type    = string
  default = "aifirst-composer"
}

variable "region" {
  type    = string
  default = "europe-west1"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "service_account_email" {
  type        = string
  description = "Service account Composer will use"
}


