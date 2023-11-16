resource "aws_security_group" "loadbalancer_sg" {
  name        = "loadbalancer_sg"
  description = "Security Group for Load Balancer"
  vpc_id     = var.vpc_id

  ingress {
    description = "Allow SSH"
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = var.cidrs_ssh_ingress
  }
  
  ingress {
    description = "Grafana Access from MY_IP"
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = var.cidrs_ssh_ingress
  }

  ingress {
    description = "Allow Prometheus from MY_IP"
    from_port = 9090
    to_port = 9090
    protocol = "tcp"
    cidr_blocks = var.cidrs_ssh_ingress
  }

  ingress {
    description = "Allow Alertmanager from MY_IP"
    from_port = 9093
    to_port = 9093
    protocol = "tcp"
    cidr_blocks = var.cidrs_ssh_ingress
  }

  ingress {
    description = "Allow Node Exporter for MY_IP"
    from_port = 9100
    to_port = 9100
    protocol = "tcp"
    cidr_blocks = var.cidrs_ssh_ingress
  }

  ingress {
    description = "Allow HTTP from Everywhere"
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = var.cidrs_egress
  }


  egress {
    description = "Allow all outbound traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = var.cidrs_egress
  }
}


#TODO: Split security groups for webserver and loadbalancer
resource "aws_security_group" "webserver_sg" {
  name        = "webserver_sg"
  description = "Security Group for App Servers"
  vpc_id     = var.vpc_id

  ingress {
    description = "Allow SSH"
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = var.cidrs_ssh_ingress
  }

  ingress {
    description = "Allow HTTP on 8080 from within VPC"
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    cidr_blocks = var.vpc_cidr
  }

  ingress {
    description = "Allow Node Exporter on 9100 from within VPC"
    from_port = 9100
    to_port = 9100
    protocol = "tcp"
    cidr_blocks = var.vpc_cidr
  }

  egress {
    description = "Allow all outbound traffic within VPC"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = var.cidrs_egress
  }
}