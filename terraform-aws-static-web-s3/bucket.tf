module "website_s3_bucket" {
  source = "./modules/aws-s3-web"
  bucket_name = "swarm-163352356417073"

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Workspace = "workspace_02"
  }
}
