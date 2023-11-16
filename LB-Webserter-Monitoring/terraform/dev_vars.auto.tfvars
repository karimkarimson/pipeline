# AWS Credentials
aws_profile = "techstarte"
region      = "eu-central-1"

# Variables for VPC Module
vpc_name                = "biggi"
vpc_cidr                = ["10.1.0.0/16"]
subnets_cidr            = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
availability_zones      = ["eu-central-1a", "eu-central-1b"]
map_public_ip_on_launch = false
tags = {
  "Terraform"   = "true"
  "Environment" = "dev"
}

# Variables for EC2 Module
ami_id            = "ami-06dd92ecc74fdfb36"
instance_type     = "t2.micro"
key_name          = "ssh-october"
cidrs_ssh_ingress = ["/32"] # Your IP
cidrs_egress      = ["0.0.0.0/0"]

instance_count = 4

# Variables for the Ansible Module
key_path = "/etc/ansible/ssh-october"

# Variables for SNS Module
email = "de" # Your Email