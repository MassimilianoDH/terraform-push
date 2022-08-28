##### main #####
################

# Azure resource group example.
# More info: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "Central US"
}