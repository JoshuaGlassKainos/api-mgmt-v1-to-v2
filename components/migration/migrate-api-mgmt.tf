module "api_mgmt" {
  source = "../../module/apim-migration"

  apim_resource_group_name = var.resource_group_name
  apim_location            = var.location

  apim_name = "${var.api_mgmt_name}-${var.location}"

  apim_vnet_name           = var.new_vnet_name
  apim_new_subnet_name     = var.new_subnet_name
  apim_new_subnet_prefixes = var.new_subnet_prefixes

  apim_nsg_name  = var.nsg_name
  apim_nsg_rules = var.nsg_rules
}