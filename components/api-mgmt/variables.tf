variable "resource_group_name" {
  default = null
}

variable "vnet_name" {
  default = null
}

variable "subnet_name" {
  default = null
}

variable "subnet_attachment" {
  type = number
}


variable "name" {
  default = "apim-test"
}

variable "location" {
  default = "westeurope"
}

variable "instance_type" {
  default = "stv1"
}

variable "address_prefixes" {
  default = ["10.0.1.0/24"]
}