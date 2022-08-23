##### config #####
##################

terraform {
  backend "gcs" {
    bucket = "tfstate"
    prefix = "states/example-bucket"
  }
}

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.32.0"
    }
  }
}
