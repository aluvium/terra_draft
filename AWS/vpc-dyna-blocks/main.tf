provider "aws" {
  region = var.region
}

data "aws_ssm_parameter" "ami_name" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

# --------------------- RESOURCES --------------------(◉‿◉ ) #
# ----------Networking  -----------------------------        #
resource "aws_vpc" "vpc" {
  cidr_block           = "172.14.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "subnet1" {
  cidr_block              = "172.14.0.0/20"
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = true
}

# ----------Routing    -----------------------------         #
resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}
resource "aws_route_table_association" "rta-subnet1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rtb.id
}

# ----------Security Gr-----------------------------         #
# Nginx sec group
resource "aws_security_group" "httpd-sg" {
  name   = "httpd-sg"
  vpc_id = aws_vpc.vpc.id
  dynamic "ingress" {
    for_each = var.rules
    content {
      from_port   = ingress.value["port"]
      to_port     = ingress.value["port"]
      protocol    = ingress.value["proto"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ----------Instances -----------------------------          #
resource "aws_instance" "httpd" {
  ami                    = data.aws_ssm_parameter.ami_name.value
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.httpd-sg.id]
  user_data              = fileexists("first.sh") ? file("first.sh") : null
}
