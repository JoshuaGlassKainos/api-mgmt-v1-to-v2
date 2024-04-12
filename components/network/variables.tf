variable "resource_group_name" {
  default = null
}

variable "vnet_name" {
  default = null
}

variable "subnet_name" {
  default = null
}

variable "nsg_name" {
  default = "nsg"
}

variable "location" {
  default = "westeurope"
}

variable "instance_type" {
  default = "stv1"
}

variable "vnet_prefixes" {
  default = null
}

variable "subnet_prefixes" {
  type = list(string)
  default = null
}

variable "subnet_count" {
  type = number
  default = 1
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