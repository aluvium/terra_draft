variable "vpc_name" {
  description = "Name of VPC"
  type = string
  default = "My-VPC"
}
variable "vpc_cidr" {
  description = "CIDR block VPC"
  type = string
  default = "10.0.0.0/16"
}
variable "vpc_azs" {
  description = "Availabilty zones for VPC"
  type = list(string)
  default = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}
variable "vpc_private_subnets" {
  description = "Private subnets for VPC"
  type = list(string)
  default = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
}
variable "vpc_public_subnets" {
  description = "Public subnets for VPC"
  type = list(string)
  default = ["10.0.20.0/24","10.0.21.0/24","10.0.22.0/24"]
}
variable "vpc_enable_nat_gateway" {
  description = "Enable NAT gateway for VPC"
  type = bool
  default = false
}
variable "vpc_tags" {
  description = "Tags to apply to resources created by VPC module"
  type = map(string)
  default = {
    Terraform = "True"
    Enviroment = "dev_01"
    Workspace = "workspace_02"
  }
}
