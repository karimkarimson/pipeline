# Variables for AWS VPC
variable "vpc_cidr" {
  type = list(string)
}
variable "vpc_name" {
  type = string
}
variable "subnets_cidr" {
  type = list(string)
}
variable "availability_zones" {
  type = list(string)
}
variable "map_public_ip_on_launch" {
  type = bool
}
variable "tags" {
  type = map(string)
}
variable "subnet_name" {
  type = map(string)
}

# Variables for AWS EC2
variable "region" {
  type = string
}
variable "aws_profile" {
  type = string
}
variable "key_name" {
  type = string
}
variable "cidrs_ssh_ingress" {
  type = list(string)
}
variable "cidrs_egress" {
  type = list(string)
}
variable "ami_id" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "instance_count" {
  type = number
}
variable "key_path" {
  type = string
}
variable "ec2_tags" {
  type = map(string)
}

# Variables for AWS SNS
variable "email" {
  type = string
}
variable "sns_topic_name" {
  type = string
}