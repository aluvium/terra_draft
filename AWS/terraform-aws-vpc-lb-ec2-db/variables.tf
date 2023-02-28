variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_subnet_cidr_blocks" {
  description = "Available cidr blocks for public subnets"
  type        = list(string)
  default = [
    "10.10.1.0/24",
    "10.10.2.0/24",
    "10.10.3.0/24",
    "10.10.4.0/24",
    "10.10.5.0/24",
    "10.10.6.0/24",
    "10.10.7.0/24",
    "10.10.8.0/24"
  ]
}

variable "private_subnet_cidr_blocks" {
  description = "Available cidr blocks for private subnets"
  type        = list(string)
  default = [
    "10.10.201.0/24",
    "10.10.202.0/24",
    "10.10.203.0/24",
    "10.10.204.0/24",
    "10.10.205.0/24",
    "10.10.206.0/24",
    "10.10.207.0/24",
    "10.10.208.0/24"
  ]
}

variable "instances_per_subnet" {
  description = "Number of EC2 instances per private subnet"
  type        = number
  default     = 2
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
  default     = "t2.micro"
}

# Warning: The following is only an example. Never check sensitive values like
# usernames and passwords into source control.

variable "db_username" {
  description = "Database administrator username."
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Database administrator password."
  type        = string
  default     = "notasecurepassword"
}
