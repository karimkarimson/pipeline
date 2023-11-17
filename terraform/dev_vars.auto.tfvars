# AWS Credentials
aws_profile = ""
region      = "eu-central-1"

# Variables for VPC Module
vpc_name                = "TF-VPC"
vpc_cidr                = ["10.1.0.0/16"]
subnets_cidr            = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"] # the length of subnets_cidr will equal to the amount of instances launched
availability_zones      = ["eu-central-1a", "eu-central-1b"]
map_public_ip_on_launch = false
tags = {
  "Terraform"   = "true"
  "Environment" = "dev"
}
subnet_name = {
  "Name" = "TF-Subnet"
}

# Variables for EC2 Module
ec2_tags = {
  "Terraform"   = "true"
  "Environment" = "dev"
  "Name"       = "TF-Instance"
}
ami_id            = "ami-06dd92ecc74fdfb36"
instance_type     = "t2.micro"
key_name          = "" # public key registered @AWS
cidrs_ssh_ingress = ["/32"] # Your IP | curl ipinfo.io
cidrs_egress      = ["0.0.0.0/0"]

# Variables for SNS Module
email = "" # your email address
sns_topic_name = "TF-Topic"