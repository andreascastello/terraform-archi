# URLs des applications
output "express_app_url" {
  description = "URL de l'application Express/MongoDB"
  value       = "https://${scalingo_app.express_mongodb_api.url}"
}

output "fastapi_app_url" {
  description = "URL de l'application FastAPI/MySQL"
  value       = "https://${scalingo_app.fastapi_mysql.url}"
}

output "react_app_url" {
  description = "URL de l'application React"
  value       = "https://${scalingo_app.react_frontend.url}"
}

# Informations sur les addons
output "mysql_addon_info" {
  description = "Informations sur l'addon MySQL"
  value = {
    app_name = scalingo_app.fastapi_mysql.name
    addon_id = scalingo_addon.mysql.id
    plan     = scalingo_addon.mysql.plan
  }
}

# Domaines personnalisés
output "express_domain" {
  description = "Domaine personnalisé pour l'API Express"
  value       = var.express_domain != "" ? "https://${var.express_domain}" : "https://${scalingo_app.express_mongodb_api.url}"
}

output "fastapi_domain" {
  description = "Domaine personnalisé pour l'API FastAPI"
  value       = var.fastapi_domain != "" ? "https://${var.fastapi_domain}" : "https://${scalingo_app.fastapi_mysql.url}"
}

output "react_domain" {
  description = "Domaine personnalisé pour React"
  value       = var.react_domain != "" ? "https://${var.react_domain}" : "https://${scalingo_app.react_frontend.url}"
}

# Informations de déploiement
output "deployment_info" {
  description = "Informations complètes sur le déploiement"
  value = {
    express_app = {
      name = scalingo_app.express_mongodb_api.name
      url  = "https://${scalingo_app.express_mongodb_api.url}"
      github_repo = var.express_github_repo
    }
    fastapi_app = {
      name = scalingo_app.fastapi_mysql.name
      url  = "https://${scalingo_app.fastapi_mysql.url}"
      github_repo = var.fastapi_github_repo
    }
    react_app = {
      name = scalingo_app.react_frontend.name
      url  = "https://${scalingo_app.react_frontend.url}"
      github_repo = var.react_github_repo
    }
    addons = {
      mysql = scalingo_addon.mysql.id
    }
  }
} 