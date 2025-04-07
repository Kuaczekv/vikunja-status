# Etap 1: Budowanie aplikacji
FROM node:20-alpine AS builder

# Ustaw katalog roboczy
WORKDIR /app

# Kopiujemy pliki aplikacji
COPY . .

# Instalujemy zależności
RUN npm install

# Budujemy aplikację
RUN npm run build

# Etap 2: Serwowanie aplikacji przez Nginx
FROM nginx:alpine

# Kopiujemy zbudowaną aplikację do folderu Nginx
COPY --from=builder /app/build /usr/share/nginx/html

# Otwieramy port 80
EXPOSE 9090
