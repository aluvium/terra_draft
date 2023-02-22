provider "aws" {
  region = var.region
}

# --------------------- DATA      --------------------(◉‿◉ ) #
data "aws_ssm_parameter" "ami_name" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

data "aws_availability_zones" "available" {
  state = "available"
}

# --------------------- RESOURCES --------------------(◉‿◉ ) #
# ----------Networking  -----------------------------        #
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.dns_hostname
  tags                 = local.common_tags

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags   = local.common_tags

}

resource "aws_subnet" "subnet1" {
  cidr_block              = var.subnets_block[0]
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = var.map_public
  availability_zone       = data.aws_availability_zones.available.names[0]
  tags                    = local.common_tags

}
resource "aws_subnet" "subnet2" {
  cidr_block              = var.subnets_block[1]
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = var.map_public
  availability_zone       = data.aws_availability_zones.available.names[1]
  tags                    = local.common_tags

}

# ----------Routing    -----------------------------         #
resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = local.common_tags

}
resource "aws_route_table_association" "rta-subnet1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rtb.id
}

resource "aws_route_table_association" "rta-subnet2" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.rtb.id
}


# ----------Security Gr-----------------------------         #
# Nginx security group
resource "aws_security_group" "nginx_sg" {
  name   = "nginx_sg"
  vpc_id = aws_vpc.vpc.id

  ## HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr_block]
  }
  ## outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = local.common_tags

}
# Application Load Balancer security group
resource "aws_security_group" "alb_sg" {
  name   = "alb_sg"
  vpc_id = aws_vpc.vpc.id

  ## HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ## outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = local.common_tags
}