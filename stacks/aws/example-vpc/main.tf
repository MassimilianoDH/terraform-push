##### main #####
################

# AWS VPC example.
# More info: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}