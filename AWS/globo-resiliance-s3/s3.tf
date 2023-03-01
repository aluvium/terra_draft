## aws_s3_bucket
resource "aws_s3_bucket" "log_bucket" {
  bucket = "local.s3_bucket_name"
}

## aws_s3__object
data "aws_s3_object" "bootstrap_script" {
  bucket = "ourcorp-deploy-config"
  key    = "ec2-bootstrap-script.sh"
}

## aws_iam_role

## aws_iam_role_policy

## aws_iam_instance_profile
