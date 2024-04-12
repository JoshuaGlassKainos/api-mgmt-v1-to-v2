data "azurerm_subnet" "subnet" {
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  name                 = "${var.subnet_name}.${var.new_subnet_attachment}"
}

module "api_mgmt" {
  source = "../../module/apim-migration"

  apim_resource_group_name = var.resource_group_name
  apim_location            = var.location

  apim_name = var.apim_name

  apim_subnet_id = data.azurerm_subnet.subnet.id
  apim_nsg_name  = var.nsg_name
  apim_nsg_rules = var.nsg_rules
}