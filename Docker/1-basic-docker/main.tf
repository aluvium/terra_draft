terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.1"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "image" {
  name         = var.img_name
  keep_locally = false
}

resource "docker_container" "build" {
  image = docker_image.image.image_id
  name  = "build"
  ports {
    internal = var.port[0]
    external = var.port[1]
  }
}
