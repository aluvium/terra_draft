resource "docker_image" "nginx" {
  name = "nginx:latest"
}
resource "docker_container" "app" {
  image = docker_image.nginx.latest
  name = var.container_name
  ports {
    internal = 80
    external = 8001
  }
}
