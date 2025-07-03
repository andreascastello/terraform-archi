variable "mongo_image" {
  description = "Image Docker MongoDB"
  type        = string
  default     = "mongo:6"
}

variable "mongo_user" {
  description = "Utilisateur root MongoDB"
  type        = string
  default     = "root"
}

variable "mongo_password" {
  description = "Mot de passe root MongoDB"
  type        = string
  default     = "example"
}

variable "mongo_database" {
  description = "Nom de la base MongoDB"
  type        = string
  default     = "blog"
}

variable "mysql_image" {
  description = "Image Docker MySQL"
  type        = string
  default     = "mysql:8"
}

variable "mysql_root_password" {
  description = "Mot de passe root MySQL"
  type        = string
  default     = "example"
}

variable "mysql_database" {
  description = "Nom de la base MySQL"
  type        = string
  default     = "users"
}

variable "adminer_image" {
  description = "Image Docker Adminer"
  type        = string
  default     = "adminer:latest"
}

variable "node_image" {
  description = "Image Docker de l'API Node.js"
  type        = string
}

variable "python_image" {
  description = "Image Docker de l'API Python"
  type        = string
}

variable "react_image" {
  description = "Image Docker de l'app React"
  type        = string
} 