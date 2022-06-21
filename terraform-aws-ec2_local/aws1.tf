terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "app_hero_1" {
  ami           = "ami-09a2a0f7d2db8baca"
  instance_type = "t2.micro"
  tags = {
    Name = var.instance_name
  }
}
