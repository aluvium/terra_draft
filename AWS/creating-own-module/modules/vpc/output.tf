output "subnet_id" {
  value = "aws_subnet.sub.id"
}
output "ami_id" {
  value = data.aws_ssm_parameter.ami_name.value
}
