##### main #####
################

resource "random_string" "resource_code" {
  length  = 5
  special = false
  upper   = false
}

# GCP service account for Terraform.
# More info: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account
resource "google_service_account" "terraform_ci" {
  account_id   = "terraform-ci"
  display_name = google_service_account.terraform_ci.account_id
}

# GCP role binding.
# More info: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam
resource "google_project_iam_member" "terraform_ci" {
  role   = "roles/owner"
  member = "serviceAccount:${google_service_account.terraform_ci.account_id}@${provider.google.project}.iam.gserviceaccount.com"
}

# GCP bucket for Terraform states.
# More info: https://registry.terraform.io/modules/terraform-google-modules/cloud-storage/google/3.2.0/submodules/simple_bucket 
module "bucket" {
  source  = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version = "3.2.0"

  name          = "tfstate${random_string.resource_code.result}"
  location      = "US"
  storage_class = "MULTI_REGIONAL"

  iam_members = [{
    role   = "roles/storage.objectAdmin"
    member = "serviceAccount:${google_service_account.terraform_ci.account_id}@${provider.google.project}.iam.gserviceaccount.com"
  }]
}
