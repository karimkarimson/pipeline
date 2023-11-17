variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = list(string)
}

variable "subnets_cidr" {
  description = "A list of subnet CIDR blocks"
  type        = list(string)
}

variable "availability_zones" {
  description = "A list of availability zones in which to place subnets"
  type        = list(string)
}

variable "map_public_ip_on_launch" {
  description = "Whether to enable auto-assign public IP on subnet"
  type        = bool
}

variable "name" {
  description = "The name of the VPC"
  type        = string
}


variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "subnet_name" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}