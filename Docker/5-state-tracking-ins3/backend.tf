# Keep state of terraform resources in s3 bucket
# 1. first create profile:       aws create --profile  <NAME> configure
# 2. second create empty bucket: aws s3api create-bucket --bucket tera-state-piter-petarda-14 --region eu-central-1 --create-bucket-configuration LocationConstraint=eu-central-1
# 3. for provision               aws s3 ls s3://tera-state-piter-petarda-14/terraform.tfstate
# 4. cp state file               aws s3 cp s3://tera-state-piter-petarda-14/terraform.tfstate .  

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
    }
  }
  backend "s3" {
    profile = "default"
    region = "eu-central-1"
    key = "terraform.tfstate"
    bucket = "tera-state-piter-petarda-14"
  }
}


