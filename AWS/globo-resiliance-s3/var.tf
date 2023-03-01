variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "dns_hostname" {
  description = "enable | disable dns"
  type        = bool
  default     = true
}

variable "vpc_cidr_block" {
  description = "VPC CIDR BLOCK"
  type        = string
  default     = "172.14.0.0/16"
}

variable "subnets_block" {
  description = "SUBNET BLOCK"
  type        = list(string)
  default     = ["172.14.0.0/20", "172.14.16.0/20"]
}

variable "map_public" {
  description = "Map a public IP address for Subnet instance"
  type        = bool
  default     = true
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

## LOCALS
variable "project" {
  description = "Project name for resource tagging"
  type        = string
  default     = "MissKittin"
}

variable "company" {
  description = "Company name for resource tagging"
  type        = string
}

variable "billing_code" {
  description = "Billing code for resource tagging"
  type        = string
}

