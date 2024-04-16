variable "resource_group_name" {
  default = null
}

variable "location" {
  default = "westeurope"
}

variable "new_vnet_name" {
  default = null
}

variable "new_subnet_name" {
  default = null
}

variable "new_subnet_attachment" {
  type = number
}

variable "api_mgmt_name" {
  default = "apim-test"
}

variable "new_vnet_prefixes" {
  type    = list(string)
  default = null
}

variable "new_subnet_prefixes" {
  type    = list(string)
  default = null
}

variable "nsg_name" {
  default = "nsg"
}

variable "nsg_rules" {
  description = "List of security rules"
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}