##### main #####
################

# GCP bucket example.
# More info: https://registry.terraform.io/modules/terraform-google-modules/cloud-storage/google/3.2.0/submodules/simple_bucket 
module "bucket" {
  source  = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version = "3.2.0"

  name       = "example-bucket"
  project_id = "example-project"
  location   = "us-central1"
  iam_members = [{
    role   = "roles/storage.objectViewer"
    member = "user:example-user@example.com"
  }]
}