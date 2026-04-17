# Dockerfile Skeleton — Expense Tracker (Node.js)
# Niveau débutant: Modules 5-7 (Docker concepts, Docker practice, Docker Compose)
# Votre tâche: Compléter ce fichier Dockerfile pour conteneuriser l'application

# ========================================================================
# TÂCHE 1: Image de base
# ========================================================================
# Qu'est-ce qu'une image de base? (Module 5: Principes Docker)
# Une image de base contient le système d'exploitation et les outils de base
# Réponse: Une image de base est le point de départ d'un conteneur Docker. Elle contient le système d'exploitation de base
# et les outils nécessaires (comme Node.js ici) pour faire fonctionner l'application.
#
# Options recommandées pour Node.js:
#   - Variante alpine:  Petit, rapide (~150MB)
#   - Variante slim:    Moyen (~180MB)
#   - Variante complet: Tout inclus (~900MB)
#
# Conseil pour débutants: Choisir la variante la plus légère pour commencer
FROM node:18-alpine

# ========================================================================
# TÂCHE 2: Répertoire de travail du conteneur
# ========================================================================
# C'est comme "cd" - tous les fichiers et commandes utiliseront ce dossier
# Conseil: Utiliser un chemin absolu dans le conteneur, pas à la racine
WORKDIR /app

# ========================================================================
# TÂCHE 3 & 4: Installer les dépendances (2 étapes)
# ========================================================================
# ÉTAPE 3: Copier les fichiers de dépendances
# Quels fichiers définissent les dépendances Node.js?
# Conseil: Dois-je copier package.json? Dois-je copier le lock file?
# Réponse: Les fichiers package.json et package-lock.json définissent les dépendances. On copie d'abord seulement ces fichiers
# pour optimiser le cache Docker - si les dépendances ne changent pas, Docker réutilise la couche d'installation.
COPY package*.json ./

# ÉTAPE 4: Installer les dépendances
# Deux commandes disponibles: npm install vs npm ci
# Conseil: Lequel utiliser dans Docker pour résultats déterministes?
# Réponse: npm ci est déterministe et plus rapide que npm install. Il installe exactement les versions définies
# dans package-lock.json, garantissant des builds reproductibles dans Docker.
RUN npm ci

# ========================================================================
# TÂCHE 5: Copier le code source de l'application
# ========================================================================
# Quels fichiers copier dans le conteneur?
# Conseil: Quels dossiers contiennent le code applicatif?
# Réponse: On copie tous les fichiers du projet (.) vers le répertoire de travail (/app).
# Le .dockerignore devrait exclure node_modules/, .git/, etc. pour optimiser la taille.
#
# Format: COPY <source locale> <destination conteneur>
# Conseil: Structurez bien pour ne pas copier node_modules/ ou .git/
#
# Astuce: Un fichier .dockerignore permet de spécifier les fichiers à ignorer
COPY . .

# ========================================================================
# TÂCHE 6: Exposer le port
# ========================================================================
# Quel port l'application utilise-t-elle?
# Conseil: Consultez src/server.js et cherchez "listen" ou "port"
# Réponse: L'application utilise le port 3000 comme défini dans src/server.js (const PORT = process.env.PORT || 3000).
#
# Note: EXPOSE est informatif (pas obligatoire), mais bon pour la documentation conteneur
# Le port réel est mappé dans docker-compose.yml
EXPOSE 3000

# ========================================================================
# TÂCHE 7: Commande de démarrage du conteneur
# ========================================================================
# Que doit-il se passer quand le conteneur démarre?
# Conseil: Regardez package.json → scripts pour voir les valeurs disponibles
# Réponse: Le conteneur doit démarrer l'application Node.js. Le script "start" dans package.json lance "node src/server.js".
# Format: CMD ["commande", "arg1", "arg2", ...]
CMD ["npm", "start"]

# ========================================================================
# NOTES PÉDAGOGIQUES (de Module 5-6)
# ========================================================================
# ✅ À COMPRENDRE:
#   - Chaque instruction crée une "couche" (layer) Docker
#   - L'ordre des instructions affecte l'efficacité du cache
#   - Dépendances AVANT code = mieux pour le cache
#   - Changer le code ne relance pas npm ci si les dépendances n'ont pas changé
#
# ✅ ÉTAPES TYPIQUES:
#   1. FROM = Choisir image de base
#   2. WORKDIR = Créer répertoire de travail
#   3. COPY dépendances = package.json + lock
#   4. RUN installer = npm ci (pas npm install)
#   5. COPY code = src/ + autres
#   6. EXPOSE = Documenter port
#   7. CMD = Commande de démarrage
#
# ❌ À ÉVITER (débutant):
#   - USER (gestion utilisateurs)
#   - HEALTHCHECK (advanced)
#   - Multi-stage builds (optimisation)
# ========================================================================
