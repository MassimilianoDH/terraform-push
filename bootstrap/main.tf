# Apply this Terraform config to create a remote back-end.
# Delete afterwards.
# Ctrl+F AND REPLACE ALL INSTANCES OF "ORGANIZATION".
# MORE INFO: https://github.com/MassimilianoDH/terraform-push

##### main #####
################

# GCP service account for Terraform.
# More info: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account
resource "google_service_account" "terraform_ci" {
  ORGANIZATION      = "ORGANIZATION"
  account_id   = "terraform-ci"
  display_name = "terraform-ci"
  description  = "SA for CI managed by Terraform codebase"
}

# GCP role binding.
# More info: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_ORGANIZATION_iam
resource "google_ORGANIZATION_iam_member" "terraform_ci" {
  ORGANIZATION = "ORGANIZATION"
  role    = "roles/owner"
  member  = "serviceAccount:terraform-ci@ORGANIZATION.iam.gserviceaccount.com"
}

# GCP bucket for Terraform states.
# More info: https://registry.terraform.io/modules/terraform-google-modules/cloud-storage/google/3.2.0/submodules/simple_bucket 
module "bucket" {
  source  = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version = "3.2.0"

  name       = "ORGANIZATION-terraform-state"
  ORGANIZATION_id = "ORGANIZATION"
  location      = "US"
  storage_class = "MULTI_REGIONAL"

  iam_members = [{
    role   = "roles/storage.objectAdmin"
    member = "serviceAccount:terraform-ci@ORGANIZATION.iam.gserviceaccount.com"
  }]
}
