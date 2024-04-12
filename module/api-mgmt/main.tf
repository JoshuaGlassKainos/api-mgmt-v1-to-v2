resource "azurerm_api_management" "api_mgmt" {
  name                = var.apim_name
  location            = var.apim_location
  resource_group_name = var.apim_resource_group_name
  publisher_name      = "My-Company"
  publisher_email     = "company@example.com"
  sku_name            = "Developer_1"

  virtual_network_type = "Internal"

  // this will migrate to st1 -> stv2, along side new subnet
  # public_ip_address_id = azurerm_public_ip.apim_ip.id

  virtual_network_configuration {
    subnet_id = var.apim_subnet_id
    # subnet_id = azurerm_subnet.subnet-new.id
  }
}


/// to create a stv2 instance

# resource "azurerm_subnet" "subnet_stv2" {
#   name                 = "apim-subnet-${var.instance_type}-2"
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = ["10.0.2.0/24"]
# }

# resource "azurerm_network_security_group" "nsg_stv2" {
#   name                = "apim-nsg-${var.instance_type}-2"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name

#   security_rule {
#     name                       = "Inbound_3443"
#     priority                   = 1001
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "3443"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }

#   security_rule {
#     name                       = "Outbound_443"
#     priority                   = 2001
#     direction                  = "Outbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "443"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }

#   security_rule {
#     name                       = "Outbound_1433"
#     priority                   = 2002
#     direction                  = "Outbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "1433"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }

#   security_rule {
#     name                       = "Outbound_1886"
#     priority                   = 2003
#     direction                  = "Outbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "1886"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }

#   security_rule {
#     name                       = "Inbound_6390"
#     priority                   = 1002
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "6390"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
# }

# resource "azurerm_subnet_network_security_group_association" "nsg_association_stv2" {
#   subnet_id                 = azurerm_subnet.subnet_stv2.id
#   network_security_group_id = azurerm_network_security_group.nsg_stv2.id

#   depends_on = [azurerm_subnet.subnet]
# }

# resource "azurerm_public_ip" "apim_ip" {
#   name                = "apim-ip"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   domain_name_label   = "apim-test-2024"
#   allocation_method   = "Static"
#   sku                 = "Standard"
# }