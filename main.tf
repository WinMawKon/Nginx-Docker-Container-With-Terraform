terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  registry_auth {
    address  = "https://index.docker.io/v1/"
    username = var.docker_username
    password = var.docker_password
  }
}
# Pulls the image
resource "docker_image" "mk-image" {
  name = "mawkon/mk-nginx:stable"
}

# Create a container
resource "docker_container" "mk-container" {
  image = docker_image.mk-image.image_id
  name  = "mk-nignx-container"
  ports {
    internal = 1918
    external = 8080
  }
}

