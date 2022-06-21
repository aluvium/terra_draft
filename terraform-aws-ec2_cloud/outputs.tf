output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_hero_2.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_hero_2.public_ip
}

