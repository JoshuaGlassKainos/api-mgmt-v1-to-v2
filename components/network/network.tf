module "network" {
  source = "../../module/network"

  apim_resource_group_name = var.resource_group_name
  apim_location            = var.location

  apim_vnet_name     = var.vnet_name
  apim_vnet_prefixes = var.vnet_prefixes

  apim_subnet_name     = var.subnet_name
  apim_subnet_prefixes = var.subnet_prefixes
  apim_subnet_count    = var.subnet_count

  apim_nsg_name  = var.nsg_name
  apim_nsg_rules = var.nsg_rules
  apim_subnet_attachment = var.subnet_attachment
}