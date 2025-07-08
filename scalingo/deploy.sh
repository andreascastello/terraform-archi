#!/bin/bash

# Script de déploiement Terraform pour Scalingo
# Usage: ./deploy.sh [init|plan|apply|destroy]

set -e

# Couleurs pour les messages
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Fonction pour afficher les messages
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Vérification des prérequis
check_prerequisites() {
    log_info "Vérification des prérequis..."
    
    if ! command -v terraform &> /dev/null; then
        log_error "Terraform n'est pas installé"
        exit 1
    fi
    
    if [ ! -f "terraform.tfvars" ]; then
        log_error "Le fichier terraform.tfvars n'existe pas"
        log_info "Copiez terraform.tfvars.example vers terraform.tfvars et configurez vos variables"
        exit 1
    fi
    
    log_success "Prérequis vérifiés"
}

# Initialisation de Terraform
init_terraform() {
    log_info "Initialisation de Terraform..."
    terraform init
    log_success "Terraform initialisé"
}

# Planification du déploiement
plan_deployment() {
    log_info "Planification du déploiement..."
    terraform plan -out=tfplan
    log_success "Planification terminée"
}

# Application du déploiement
apply_deployment() {
    log_info "Application du déploiement..."
    
    if [ ! -f "tfplan" ]; then
        log_warning "Aucun plan trouvé, création d'un nouveau plan..."
        terraform plan -out=tfplan
    fi
    
    terraform apply tfplan
    log_success "Déploiement appliqué avec succès"
    
    # Affichage des outputs
    log_info "URLs des applications déployées :"
    terraform output
}

# Destruction des ressources
destroy_deployment() {
    log_warning "ATTENTION: Cette action va détruire toutes les ressources Scalingo"
    read -p "Êtes-vous sûr de vouloir continuer ? (y/N): " -n 1 -r
    echo
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        log_info "Destruction des ressources..."
        terraform destroy
        log_success "Ressources détruites"
    else
        log_info "Destruction annulée"
    fi
}

# Nettoyage
cleanup() {
    log_info "Nettoyage des fichiers temporaires..."
    rm -f tfplan
    log_success "Nettoyage terminé"
}

# Fonction principale
main() {
    case "${1:-help}" in
        "init")
            check_prerequisites
            init_terraform
            ;;
        "plan")
            check_prerequisites
            init_terraform
            plan_deployment
            ;;
        "apply")
            check_prerequisites
            init_terraform
            apply_deployment
            cleanup
            ;;
        "destroy")
            check_prerequisites
            destroy_deployment
            ;;
        "cleanup")
            cleanup
            ;;
        "help"|*)
            echo "Usage: $0 [init|plan|apply|destroy|cleanup]"
            echo ""
            echo "Commandes:"
            echo "  init     - Initialise Terraform"
            echo "  plan     - Planifie le déploiement"
            echo "  apply    - Applique le déploiement"
            echo "  destroy  - Détruit toutes les ressources"
            echo "  cleanup  - Nettoie les fichiers temporaires"
            echo "  help     - Affiche cette aide"
            ;;
    esac
}

# Exécution du script
main "$@" 