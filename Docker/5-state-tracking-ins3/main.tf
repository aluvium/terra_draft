provider "docker" {}

resource "docker_image" "nginx_img" {
   name = "nginx:latest"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx_img.image_id
  name = "serverX"
  ports {
    internal = 80
    external = var.external_port
    protocol = "tcp"
  }
}

output "url" {
  description = "URL for container site"
  value = join(":",["http://localhost", tostring(var.external_port)])
}
