##### config #####
##################

# More info: https://github.com/nozaq/terraform-aws-remote-state-s3-backend
provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "replica"
  region = "us-west-1"
}