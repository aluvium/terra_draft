terraform {
 required_providers {
  docker = {
    source = "kreuzwerker/docker"
    version = "~> 2.16.0"
    }
  random ={
    source = "hashicorp/random"
    version = "3.3.2"
    }
  }
}


provider "docker" {}
provider "random" {}

resource "docker_image" "nginx" {
   name = "nginx:latest"
   keep_locally = false
}
resource "docker_container" "proxy" {
   image = docker_image.nginx.latest
   name = "reverse-proxy"
   ports {
     internal = 80
     external = 8000
   }
}
resource "random_id" "server" {
  byte_length = 8  
}

module "server" {
  source = "./modules"
  container_name = "app-${random_id.server.id}"
}
