# 🚀 Déploiement Scalingo avec Terraform

Ce dossier contient la configuration Terraform complète pour déployer l'architecture complète sur **Scalingo** :

- **API Node.js + MongoDB Atlas** (posts)
- **API FastAPI + MySQL** (utilisateurs)
- **Application React** (frontend)

## 📋 Architecture Déployée

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   React App     │    │  Express API    │    │  FastAPI        │
│   (Frontend)    │◄──►│  (MongoDB)      │    │  (MySQL)        │
│                 │    │                 │    │                 │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         │                       │                       │
         └───────────────────────┼───────────────────────┘
                                 │
                    ┌─────────────┴─────────────┐
                    │      Scalingo Platform    │
                    │  (Auto-scaling, SSL, CDN) │
                    └───────────────────────────┘
```

## 🛠 Prérequis

- **Terraform** >= 1.0
- **Compte Scalingo** avec accès API
- **Token d'API Scalingo** (généré depuis le dashboard)
- **Cluster MongoDB Atlas** (pour l'API Express)
- **GitHub repos** configurés

## ⚙️ Configuration

### 1. Variables Requises

Copiez le fichier d'exemple et configurez vos variables :

```bash
cp terraform.tfvars.example terraform.tfvars
```

Variables obligatoires à configurer :

```hcl
# Token d'API Scalingo (obligatoire)
scalingo_token = "your_scalingo_api_token_here"

# URI MongoDB Atlas (obligatoire)
mongodb_atlas_uri = "mongodb+srv://username:password@cluster.mongodb.net/blog?retryWrites=true&w=majority"

# Clé secrète JWT (obligatoire)
jwt_secret = "your_super_secret_jwt_key_here"
```

### 2. Variables Optionnelles

```hcl
# Noms des applications (par défaut)
express_app_name = "express-mongodb-api"
fastapi_app_name = "fastapi-mysql-api"
react_app_name = "react-frontend"

# Région Scalingo (par défaut: osc-fr1)
scalingo_region = "osc-fr1"

# Domaines personnalisés (optionnel)
express_domain = "api-express.yourdomain.com"
fastapi_domain = "api-fastapi.yourdomain.com"
react_domain = "app.yourdomain.com"
```

## 🚀 Déploiement

### Méthode 1 : Script Automatisé (Recommandé)

```bash
# Initialisation
./deploy.sh init

# Planification
./deploy.sh plan

# Déploiement
./deploy.sh apply

# Destruction (si nécessaire)
./deploy.sh destroy
```

### Méthode 2 : Commandes Terraform Directes

```bash
# Initialisation
terraform init

# Planification
terraform plan

# Déploiement
terraform apply

# Affichage des outputs
terraform output
```

## 📊 Ressources Créées

### Applications Scalingo
- **express-mongodb-api** : API Node.js avec MongoDB Atlas
- **fastapi-mysql-api** : API FastAPI avec MySQL
- **react-frontend** : Application React

### Addons
- **MongoDB Atlas** (plan free) pour l'API Express
- **MySQL** (plan sandbox) pour l'API FastAPI

### Variables d'Environnement
- Configuration automatique des connexions DB
- Variables JWT et de production
- URLs des APIs configurées automatiquement

## 🔗 URLs Générées

Après le déploiement, vous obtiendrez :

```
Express API: https://express-mongodb-api.osc-fr1.scalingo.io
FastAPI:     https://fastapi-mysql-api.osc-fr1.scalingo.io
React App:   https://react-frontend.osc-fr1.scalingo.io
```

## 🔄 Déploiement Continu

Les applications sont configurées pour :
- **Auto-déploiement** depuis GitHub
- **Build automatique** à chaque push
- **Rollback automatique** en cas d'erreur

## 🛡️ Sécurité

- **Variables sensibles** marquées comme `sensitive`
- **HTTPS automatique** sur tous les domaines
- **Isolation** des environnements
- **Secrets** gérés via variables d'environnement

## 📈 Monitoring

- **Logs automatiques** via Scalingo
- **Métriques** de performance
- **Alertes** configurables
- **Health checks** automatiques

## 🧹 Nettoyage

```bash
# Destruction complète
./deploy.sh destroy

# Nettoyage des fichiers temporaires
./deploy.sh cleanup
```

## 🆘 Dépannage

### Erreurs Communes

1. **Token Scalingo invalide**
   ```bash
   # Vérifiez votre token dans le dashboard Scalingo
   ```

2. **URI MongoDB invalide**
   ```bash
   # Vérifiez la connexion MongoDB Atlas
   # Testez l'URI avec MongoDB Compass
   ```

3. **Nom d'application déjà pris**
   ```bash
   # Changez le nom dans terraform.tfvars
   express_app_name = "mon-api-express-unique"
   ```

### Logs et Debug

```bash
# Vérification du plan
terraform plan -detailed-exitcode

# Affichage des outputs
terraform output -json

# Validation de la configuration
terraform validate
```

## 📚 Ressources

- [Documentation Scalingo](https://doc.scalingo.com/)
- [Provider Terraform Scalingo](https://registry.terraform.io/providers/Scalingo/scalingo/latest/docs)
- [MongoDB Atlas](https://docs.atlas.mongodb.com/)

---

**🎯 Challenge GOAT : Mission accomplie !** 🐐

Votre infrastructure complète est maintenant prête pour le déploiement sur Scalingo avec Terraform ! 