module "resource_group" {
  source = "../../module/resource-group"

  apim_resource_group_name = var.resource_group_name
  apim_location            = var.location
}