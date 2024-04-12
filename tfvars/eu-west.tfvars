location        = "westeurope"
vnet_prefixes   = ["10.0.0.0/16"]
subnet_prefixes = ["10.0.1.0/24", "10.0.2.0/24"]

resource_group_name = "apim-resources"
apim_name           = "apim-test-westeurope"
vnet_name           = "apim-vnet"
subnet_name         = "apim-subnet"
subnet_count        = 2

nsg_name = "nsg-v1"
subnet_attachment     = 0

nsg_rules = [
  {
    name                       = "Inbound_3443"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "Outbound_443"
    priority                   = 2001
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "Outbound_1433"
    priority                   = 2002
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "1433"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "Outbound_1886"
    priority                   = 2003
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "1886"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
]