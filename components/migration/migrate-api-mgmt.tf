data "azurerm_subnet" "subnet" {
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  name                 = var.new_subnet_attachment
}

module "api_mgmt" {
  source = "../../module/api-mgmt"

  apim_resource_group_name = var.resource_group_name

  apim_name             = "${var.name}-${var.location}"
  apim_location         = var.location
  apim_address_prefixes = var.address_prefixes
  apim_subnet_id        = data.azurerm_subnet.subnet.id
}