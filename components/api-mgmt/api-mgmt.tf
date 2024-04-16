data "azurerm_subnet" "subnet" {
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  name                 = "${var.subnet_name}.${var.subnet_attachment}"

}

module "api_mgmt" {
  source = "../../module/api-mgmt"

  apim_resource_group_name = var.resource_group_name

  apim_name      = "${var.api_mgmt_name}-${var.location}"
  apim_location  = var.location
  apim_subnet_id = data.azurerm_subnet.subnet.id
}