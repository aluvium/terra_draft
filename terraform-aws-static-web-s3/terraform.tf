terraform {
  cloud {
    organization = "aluvium"
    workspaces {
      name = "Workspace_02"
    }
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.4.0"
    }
  }
  required_version = ">= 1.1.0"
}

