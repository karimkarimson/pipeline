resource "aws_subnet" "my_subnet" {
  count                   = length(var.subnets_cidr)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnets_cidr[count.index]
  # availability_zone       = (count.index +1) % 2  > 0 ? var.availability_zones[0] : var.availability_zones[1]
  availability_zone = var.availability_zones[count.index % length(var.availability_zones)]

  #TODO: Jumphost Config
  # map_public_ip_on_launch = count.index > 0 ? false : true

  tags = var.subnet_name
}