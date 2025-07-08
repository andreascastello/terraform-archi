# Variables d'authentification Scalingo
variable "scalingo_token" {
  description = "Token d'API Scalingo"
  type        = string
  sensitive   = true
}

# Noms des applications
variable "express_app_name" {
  description = "Nom de l'application Express/MongoDB"
  type        = string
  default     = "express-mongodb-api"
}

variable "fastapi_app_name" {
  description = "Nom de l'application FastAPI/MySQL"
  type        = string
  default     = "fastapi-mysql-api"
}

variable "react_app_name" {
  description = "Nom de l'application React"
  type        = string
  default     = "react-frontend"
}

# URLs des repos GitHub
variable "express_github_repo" {
  description = "URL du repo GitHub pour l'API Express"
  type        = string
  default     = "https://github.com/andreascastello/express-mongodb-app"
}

variable "fastapi_github_repo" {
  description = "URL du repo GitHub pour l'API FastAPI"
  type        = string
  default     = "https://github.com/andreascastello/integ-deploiement"
}

variable "react_github_repo" {
  description = "URL du repo GitHub pour React"
  type        = string
  default     = "https://github.com/andreascastello/integ-deploiement"
}

# Variables d'environnement MongoDB
variable "mongodb_atlas_uri" {
  description = "URI de connexion MongoDB Atlas"
  type        = string
  sensitive   = true
}

# Variables d'environnement MySQL
variable "mysql_host" {
  description = "Hôte MySQL"
  type        = string
  default     = "localhost"
}

variable "mysql_database" {
  description = "Nom de la base de données MySQL"
  type        = string
  default     = "users"
}

variable "mysql_user" {
  description = "Utilisateur MySQL"
  type        = string
  default     = "root"
}

variable "mysql_password" {
  description = "Mot de passe MySQL (généré automatiquement par l'addon Scalingo)"
  type        = string
  default     = ""
  sensitive   = true
}

# Variables de sécurité
variable "jwt_secret" {
  description = "Clé secrète JWT"
  type        = string
  sensitive   = true
}

# Domaines personnalisés (optionnels)
variable "express_domain" {
  description = "Domaine personnalisé pour l'API Express"
  type        = string
  default     = ""
}

variable "fastapi_domain" {
  description = "Domaine personnalisé pour l'API FastAPI"
  type        = string
  default     = ""
}

variable "react_domain" {
  description = "Domaine personnalisé pour React"
  type        = string
  default     = ""
} 