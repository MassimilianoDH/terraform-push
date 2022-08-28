##### config #####
##################

# More info: https://github.com/nozaq/terraform-aws-remote-state-s3-backend
provider "aws" {
  region = "us-central-1"
}

provider "aws" {
  alias  = "replica"
  region = "us-west-1"
}