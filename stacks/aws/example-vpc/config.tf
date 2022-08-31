##### config #####
##################

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.28.0"
    }
  }
  backend "s3" {
    bucket         = "THE_NAME_OF_THE_STATE_BUCKET" # Terraform Plan Output
    key            = "states/example-vpc/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    kms_key_id     = "THE_ID_OF_THE_KMS_KEY"        # Terraform Plan Output
    dynamodb_table = "THE_ID_OF_THE_DYNAMODB_TABLE" # Terraform Plan Output
  }
}