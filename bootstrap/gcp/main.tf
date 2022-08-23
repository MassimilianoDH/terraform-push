##### main #####
################

# GCP service account for Terraform.
# More info: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account
resource "google_service_account" "terraform_ci" {
  account_id   = "terraform-ci"
  display_name = "terraform-ci"
}

# GCP role binding.
# More info: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam
resource "google_project_iam_member" "terraform_ci" {
  role   = "roles/owner"
  member = "serviceAccount:terraform-ci@project.iam.gserviceaccount.com"
}

# GCP bucket for Terraform states.
# More info: https://registry.terraform.io/modules/terraform-google-modules/cloud-storage/google/3.2.0/submodules/simple_bucket 
module "bucket" {
  source  = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version = "3.2.0"

  name          = "tfstate"
  location      = "US"
  storage_class = "MULTI_REGIONAL"

  iam_members = [{
    role   = "roles/storage.objectAdmin"
    member = "serviceAccount:terraform-ci@project.iam.gserviceaccount.com"
  }]
}
