terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.56.0"
    }
  
    random = {
      source = "hashicorp/random"
      version = "~> 3.4.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.region
}

provider "random" {
  # Configuration options
}
