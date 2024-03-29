##### config #####
##################

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.32.0"
    }
  }
  backend "gcs" {
    bucket = "tfstate12345"
    prefix = "states/example-bucket"
  }
}
