# 🔐 Configuration des Secrets GitHub

Ce fichier liste tous les secrets GitHub nécessaires pour le déploiement Terraform sur Scalingo.

## 📋 Secrets Requis

### 1. `SCALINGO_TOKEN`
**Description** : Token d'API Scalingo pour l'authentification  
**Où l'obtenir** : 
1. Connectez-vous à [Scalingo Dashboard](https://my.scalingo.com/)
2. Allez dans **Account** → **API Tokens**
3. Cliquez sur **Create a new token**
4. Copiez le token généré

**Format** : `scalingo_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`

### 2. `MONGODB_ATLAS_URI`
**Description** : URI de connexion MongoDB Atlas  
**Où l'obtenir** :
1. Connectez-vous à [MongoDB Atlas](https://cloud.mongodb.com/)
2. Sélectionnez votre cluster
3. Cliquez sur **Connect**
4. Choisissez **Connect your application**
5. Copiez l'URI de connexion

**Format** : `mongodb+srv://username:password@cluster.mongodb.net/blog?retryWrites=true&w=majority`

### 3. `JWT_SECRET`
**Description** : Clé secrète pour signer les tokens JWT  
**Génération** :
```bash
# Générer une clé secrète aléatoire
openssl rand -base64 32
```

**Format** : Chaîne aléatoire de 32+ caractères

## ⚙️ Configuration dans GitHub

### Méthode 1 : Interface Web
1. Allez dans votre repo GitHub
2. Cliquez sur **Settings** → **Secrets and variables** → **Actions**
3. Cliquez sur **New repository secret**
4. Ajoutez chaque secret avec son nom et sa valeur

### Méthode 2 : GitHub CLI
```bash
# Installation de GitHub CLI
gh auth login

# Ajout des secrets
gh secret set SCALINGO_TOKEN --body "your_scalingo_token_here"
gh secret set MONGODB_ATLAS_URI --body "your_mongodb_uri_here"
gh secret set JWT_SECRET --body "your_jwt_secret_here"
```

## 🔒 Sécurité

### Bonnes Pratiques
- ✅ Utilisez des tokens avec des permissions minimales
- ✅ Régénérez régulièrement vos tokens
- ✅ Ne partagez jamais vos secrets
- ✅ Utilisez des variables d'environnement en local

### Rotation des Secrets
```bash
# Régénérer un token Scalingo
# 1. Créez un nouveau token dans Scalingo Dashboard
# 2. Mettez à jour le secret GitHub
# 3. Supprimez l'ancien token

# Régénérer JWT_SECRET
openssl rand -base64 32
```

## 🧪 Test des Secrets

### Test Scalingo Token
```bash
curl -H "Authorization: Bearer $SCALINGO_TOKEN" \
     https://api.scalingo.com/v1/apps
```

### Test MongoDB URI
```bash
# Avec MongoDB Compass ou mongo shell
mongosh "your_mongodb_uri_here"
```

## 🆘 Dépannage

### Erreur "Invalid token"
- Vérifiez que le token Scalingo est valide
- Régénérez le token si nécessaire

### Erreur "Connection failed"
- Vérifiez l'URI MongoDB Atlas
- Assurez-vous que l'IP est autorisée

### Erreur "JWT malformed"
- Vérifiez que JWT_SECRET est bien défini
- Assurez-vous qu'il n'y a pas d'espaces

## 📚 Ressources

- [Scalingo API Documentation](https://developers.scalingo.com/)
- [MongoDB Atlas Documentation](https://docs.atlas.mongodb.com/)
- [GitHub Secrets Documentation](https://docs.github.com/en/actions/security-guides/encrypted-secrets) 