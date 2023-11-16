variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_profile" {
  type = string
  default = ""
}

variable "key_name" {
  type = string
}

variable "profile_name" {
  type = string
}

variable "cidrs_ssh_ingress" {
  type = list(string)
}

variable "cidrs_egress" {
  type = list(string)
}

variable "instance_count" {
  type = number
}
variable "subnet_id" {
  type = list(string)
}

variable "vpc_cidr" {
  type = list(string)
}
variable "vpc_id" {
  type = string
}