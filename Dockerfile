# Utiliser une image de base Node.js légère
# AMELIORATION: Par valendino - Choix de l'image alpine pour une taille réduite
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
