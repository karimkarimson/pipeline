resource "aws_instance" "ec2_instance" {
  count           = var.instance_count
  ami             = var.ami_id
  instance_type   = var.instance_type

  associate_public_ip_address = true

  # subnet_id =  ((count.index + 1) % 2 > 0) ? var.subnet_id[1] : var.subnet_id[0]
  # Distribute instances evenly among available subnets
  subnet_id = var.subnet_id[0]
  # subnet_id = var.subnet_id[(count.index % 2 )]

  vpc_security_group_ids = count.index > 0 ? [aws_security_group.webserver_sg.id] : [aws_security_group.loadbalancer_sg.id]
  # security_groups = (count.index > 0) ? [aws_security_group.loadbalancer_sg.id] : [aws_security_group.webserver_sg.id]
  key_name        = var.key_name
}