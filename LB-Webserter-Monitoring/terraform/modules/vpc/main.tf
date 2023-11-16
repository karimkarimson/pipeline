resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr[0]

  tags = {
      Name = var.name
  }
}
