module "vpc" {
  source = "./modules/vpc"

  # Variables
  vpc_cidr                = var.vpc_cidr
  name                    = var.vpc_name
  subnets_cidr            = var.subnets_cidr
  availability_zones      = var.availability_zones
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags                    = var.tags
}
module "ec2" {
  source     = "./modules/ec2"
  depends_on = [module.vpc]

  instance_count = var.instance_count
  key_name       = var.key_name
  profile_name   = var.aws_profile

  ami_id        = var.ami_id
  instance_type = var.instance_type

  # Security Group relevant
  cidrs_ssh_ingress = var.cidrs_ssh_ingress
  cidrs_egress      = var.cidrs_egress
  vpc_cidr          = var.vpc_cidr

  # Depends on VPC
  subnet_id = module.vpc.subnet_id
  vpc_id    = module.vpc.vpc_id
}

#! currently not needed
# module "ansible" {
#   source     = "./modules/ansible"
#   depends_on = [module.ec2]

#   # Variables
#   key_path    = var.key_path
#   public_ips  = module.ec2.instance_ip
#   private_ips = module.ec2.instance_private_ip
# }

module "sns_module" {
  source = "./modules/sns"

  email = var.email
}