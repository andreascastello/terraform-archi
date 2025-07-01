# terraform-archi

## Objectif
Ce dépôt permet de provisionner et déployer automatiquement deux architectures applicatives via Terraform :

- **Architecture 1 :** Node.js + MongoDB (API posts)
- **Architecture 2 :** React + Python + MySQL + Adminer (gestion utilisateurs)

Le déploiement peut se faire soit en local via Docker, soit sur Scalingo.

---

## Structure du dépôt

```
terraform-archi/
  docker/        # Provisionnement Docker local/cloud
  scalingo/      # Provisionnement Scalingo
  .github/       # Pipelines CI/CD
  README.md      # Ce fichier
```

- **docker/** : Fichiers Terraform pour déployer les images Docker des différentes apps.
- **scalingo/** : Fichiers Terraform pour déployer les apps sur Scalingo, reliées à vos repos GitHub.
- **.github/workflows/** : Pipelines GitHub Actions pour automatiser les tests, le build, le déploiement et le trigger Terraform.

---

## Prérequis
- [Terraform](https://www.terraform.io/downloads)
- [Docker](https://www.docker.com/products/docker-desktop) (pour l'architecture Docker)
- [Scalingo CLI](https://cli.scalingo.com/) (pour l'architecture Scalingo)
- Accès aux repos des applications (Node/Mongo, React/Python/MySQL)

---

## Utilisation

### 1. Déploiement Docker
```bash
cd docker
terraform init
terraform apply
```

### 2. Déploiement Scalingo
```bash
cd scalingo
terraform init
terraform apply
```

---

## Pipelines CI/CD
Les pipelines GitHub Actions :
- Lancement des tests unitaires et d'intégration
- Build des images
- Déploiement Docker
- Lancement des tests end-to-end
- Déclenchement du provider Terraform

---

## Membres du groupe
- **Nom 1** : rôle (ex : backend Node/Mongo)
- **Nom 2** : rôle (ex : frontend React, intégration)
- **Nom 3** : rôle (ex : Python/MySQL, CI/CD)

> Merci de compléter avec vos noms et rôles respectifs.

---

## Documentation complémentaire
Chaque dossier (`docker/`, `scalingo/`) contient un README spécifique avec les variables et instructions détaillées. 