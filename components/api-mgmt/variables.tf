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