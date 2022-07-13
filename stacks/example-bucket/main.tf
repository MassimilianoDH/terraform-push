##### main #####
################

# GCP bucket example.
# More info: https://registry.terraform.io/modules/terraform-google-modules/cloud-storage/google/3.2.0/submodules/simple_bucket 
module "bucket" {
  source  = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version = "3.2.0"

  name       = "ORGANIZATION-example-bucket"
  project_id = "ORGANIZATION"
  location      = "US"
  storage_class = "MULTI_REGIONAL"

  iam_members = [{
    role   = "roles/storage.objectAdmin"
    member = "user:example-user@example.com"
  }]
}