terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Réseau commun
resource "docker_network" "app_net" {
  name = "app_net"
}

# MongoDB
resource "docker_image" "mongo" {
  name = var.mongo_image
}
resource "docker_container" "mongo" {
  name  = "mongo"
  image = docker_image.mongo.name
  networks_advanced {
    name = docker_network.app_net.name
  }
  env = [
    "MONGO_INITDB_ROOT_USERNAME=${var.mongo_user}",
    "MONGO_INITDB_ROOT_PASSWORD=${var.mongo_password}"
  ]
  ports {
    internal = 27017
    external = 27017
  }
}

# MySQL
resource "docker_image" "mysql" {
  name = var.mysql_image
}
resource "docker_container" "mysql" {
  name  = "mysql"
  image = docker_image.mysql.name
  networks_advanced {
    name = docker_network.app_net.name
  }
  env = [
    "MYSQL_ROOT_PASSWORD=${var.mysql_root_password}",
    "MYSQL_DATABASE=${var.mysql_database}"
  ]
  ports {
    internal = 3306
    external = 3306
  }
}

# Adminer
resource "docker_image" "adminer" {
  name = var.adminer_image
}
resource "docker_container" "adminer" {
  name  = "adminer"
  image = docker_image.adminer.name
  networks_advanced {
    name = docker_network.app_net.name
  }
  ports {
    internal = 8081
    external = 8081
  }
}

# Node.js API (MongoDB)
resource "docker_image" "node_api" {
  name = var.node_image
}
resource "docker_container" "node_api" {
  name  = "node_api"
  image = docker_image.node_api.name
  networks_advanced {
    name = docker_network.app_net.name
  }
  env = [
    "MONGO_URL=mongodb://${var.mongo_user}:${var.mongo_password}@mongo:27017/${var.mongo_database}"
  ]
  ports {
    internal = 8080
    external = 8080
  }
  depends_on = [docker_container.mongo]
}

# Python API (MySQL)
resource "docker_image" "python_api" {
  name = var.python_image
}
resource "docker_container" "python_api" {
  name  = "python_api"
  image = docker_image.python_api.name
  networks_advanced {
    name = docker_network.app_net.name
  }
  env = [
    "MYSQL_HOST=mysql",
    "MYSQL_DATABASE=${var.mysql_database}",
    "MYSQL_USER=root",
    "MYSQL_PASSWORD=${var.mysql_root_password}"
  ]
  ports {
    internal = 8000
    external = 8000
  }
  depends_on = [docker_container.mysql]
}

# React App
resource "docker_image" "react_app" {
  name = var.react_image
}
resource "docker_container" "react_app" {
  name  = "react_app"
  image = docker_image.react_app.name
  networks_advanced {
    name = docker_network.app_net.name
  }
  env = [
    "VITE_API_URL=http://localhost:8000",
    "VITE_NODE_API_URL=http://localhost:8080"
  ]
  ports {
    internal = 3000
    external = 3000
  }
} 