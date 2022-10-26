variable "aws_region" {
  description = "AWS region"
  type = string
  default = "eu-central-1"
}

variable "vpc_cidr_block" {
  description = "CIDR for VPC"
  type = string
  default = "10.10.0.0/16"
}

variable "instance_count" {
  description = "Nr of instances to provision"
  type = number
  default = 2
}

variable "enable_vpn_gateway" {
  description = "Enable a VPN gateway"
  type = bool
  default = false
}

variable "public_subnet_count" {
  description = "Nr of public subnets"
  type = string
  default = 1
}

variable "private_subnet_count" {
  description = "Nr of private subnetes"
  type = string
  default = 1
}

variable "public_subnets_cidr_blocks" {
  description = "Available cidr blocks for public subnets."
  type        = list(string)
  default     = [
    "10.10.1.0/24",
    "10.10.2.0/24",
    "10.10.3.0/24",
    "10.10.4.0/24",
    "10.10.5.0/24",
    "10.10.6.0/24",
    "10.10.7.0/24",
    "10.10.8.0/24",
  ]
}

variable "private_subnets_cidr_blocks" {
  description = "Available cidr blocks for private subnets."
  type        = list(string)
  default     = [
    "10.10.201.0/24",
    "10.10.202.0/24",
    "10.10.203.0/24",
    "10.10.204.0/24",
    "10.10.205.0/24",
    "10.10.206.0/24",
    "10.10.207.0/24",
    "10.10.208.0/24",
  ]
}

variable "resource_tags" {
  description = "tags to set for all resources"
  type = map(string)
  default = {
    project = "kate1"
    enviroment = "dev"
  }
}

variable "ec2_instance_type" {
  description = "AWS ec2 instance type"
  type = string 
}
