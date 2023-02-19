provider "aws" {
  region = var.region
}

resource "aws_vpc" "vpc" {
  cidr_block = "172.13.0.0/16"
}
resource "aws_subnet" "sub" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "172.13.5.0/24"
}

data "aws_ssm_parameter" "ami_name" {
  name = "/aws/service/ami-amazon-linux-latest/amzn-ami-hvm-x86_64-gp2"
}
