output "web-url" {
  description = "web-url"
  value       = join("", ["http://", aws_instance.httpd.public_ip])
}

output "time-stamp" {
  description = "Show execution timestamp"
  value       = timestamp()
}
