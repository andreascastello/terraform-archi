terraform {
  required_providers {
    scalingo = {
      source  = "Scalingo/scalingo"
      version = "~> 1.0"
    }
  }
  required_version = ">= 1.0"
}

provider "scalingo" {
  api_token = var.scalingo_token
}

# Application Node.js + MongoDB (Express API)
resource "scalingo_app" "express_mongodb_api" {
  name = var.express_app_name
}

# Application Python + MySQL (FastAPI)
resource "scalingo_app" "fastapi_mysql" {
  name = var.fastapi_app_name
}

# Addon MySQL pour l'API FastAPI
resource "scalingo_addon" "mysql" {
  app = scalingo_app.fastapi_mysql.name
  provider_id = "scalingo-mysql"
  plan = "mysql-sandbox"
}

# Application React (Frontend)
resource "scalingo_app" "react_frontend" {
  name = var.react_app_name
}

# Configuration des domaines personnalisés (optionnel)
resource "scalingo_domain" "express_domain" {
  count = var.express_domain != "" ? 1 : 0
  app   = scalingo_app.express_mongodb_api.name
  common_name = var.express_domain
}

resource "scalingo_domain" "fastapi_domain" {
  count = var.fastapi_domain != "" ? 1 : 0
  app   = scalingo_app.fastapi_mysql.name
  common_name = var.fastapi_domain
}

resource "scalingo_domain" "react_domain" {
  count = var.react_domain != "" ? 1 : 0
  app   = scalingo_app.react_frontend.name
  common_name = var.react_domain
} 