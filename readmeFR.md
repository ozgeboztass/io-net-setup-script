# Script d'installation d'IO Net (Ubuntu,Fedora,Arch Linux,Debian)
Ce dépôt contient un script Bash permettant de définir les prérequis pour la plateforme IO Net. Le script est conçu pour différentes distributions Linux et traite spécifiquement des configurations nécessaires pour les systèmes équipés de GPU Nvidia.

## Démarrage
Ces instructions vous guideront dans l'utilisation du script d'installation de ce dépôt.
### Prérequis
Pour télécharger le script, assurez-vous que 'curl' est installé sur votre système.
- Si ce n'est pas le cas, installez-le en exécutant la commande suivante.
     ```
     sudo apt install curl
     ``` 
### Installation avec le terminal
1) **Téléchargez le script d'installation**:
   ```bash
   curl -L https://github.com/ozgeboztass/io-net-setup-script/raw/main/ionet-setup.sh -o ionet-setup.sh
2) Exécutez le script :
   ```bash
   chmod +x ionet-setup.sh && ./ionet-setup.sh
   
## Vue d'ensemble du script
Le script `ionet-setup.sh` effectue les opérations suivantes :
- Il définit les variables globales et détermine le système d'exploitation et la version.
- Il vérifie la présence d'un GPU Nvidia et installe les pilotes et les outils CUDA nécessaires en fonction de la distribution et de la version de Linux spécifiées.
- Configure Docker et Docker Compose et configure Nvidia Docker si un GPU Nvidia est détecté.
- Ajoute l'utilisateur à un groupe Docker.
## Distributions prises en charge

- Ubuntu (20.04, 22.04, 18.04)
- Debian (10, 11)
- Arch Linux
- Fedora

## Contributions
Vos contributions à ce script sont les bienvenues. Veillez à ce que les pull requests ou les problèmes soient liés à la fonctionnalité et à la compatibilité du script.

