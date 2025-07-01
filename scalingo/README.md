# Déploiement Scalingo

Ce dossier contient les fichiers Terraform pour provisionner les applications sur Scalingo :

- API Node.js + MongoDB (posts)
- Application React + API Python/MySQL + Adminer (utilisateurs)

Chaque application est reliée à son dépôt GitHub pour un déploiement continu.

---

## Prérequis
- Terraform
- Compte Scalingo et accès API
- Scalingo CLI (pour vérification et debug)
- Accès aux repos GitHub des applications

---

## Variables principales
- `scalingo_token` : token d'accès API Scalingo
- `github_repo_url` : URL du repo GitHub à déployer
- `app_env` : variables d'environnement à injecter

---

## Utilisation
```bash
terraform init
terraform apply
```

---

## Notes
- Les apps sont créées automatiquement sur Scalingo.
- Les déploiements sont déclenchés à chaque push sur le repo GitHub.
- Voir le fichier `main.tf` pour la logique complète. 