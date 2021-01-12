variable "name" {
  type = string
}

variable "instance_count" {
  type    = number
  default = 0
}

variable "resource_pool_id" {
  type = string
}

variable "folder" {
  type = string
}

variable "datastore" {
  type = string
}

variable "network" {
  type = string
}

variable "datacenter_id" {
  type = string
}

variable "template" {
  type = string
}

variable "memory" {
  type    = number
  default = 2048
}

variable "num_cpu" {
  type    = number
  default = 1
}

variable "disk_size" {
  type    = number
  default = 40
}

variable "Domain" {
  type = string
}

variable "list_Domanin" {
  type    = list
  default = []
}

variable "ip" {
  type = string
}

variable "Netmask" {
  type = string
}

variable "Gateway" {
  type = string
}

variable "DNS" {
  type    = list
  default = []
}