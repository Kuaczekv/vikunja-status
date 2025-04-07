# Użyj oficjalnego obrazu Node.js jako bazy
FROM node:20-alpine AS builder

# Ustaw katalog roboczy
WORKDIR /app

# Skopiuj pliki aplikacji do kontenera
COPY . .

# Zainstaluj zależności aplikacji
RUN npm install

# Zbuduj aplikację
RUN npm run build

# Użyj obrazu Nginx do serwowania aplikacji
FROM nginx:alpine

# Skopiuj pliki zbudowane z poprzedniego etapu do katalogu Nginx
COPY --from=builder /app/dist /usr/share/nginx/html

# Skonfiguruj zmienne środowiskowe
# (przekazujemy zmienne, które będą używane przez frontend)
ENV VITE_VIKUNJA_API=https://todo.presetserwis.pl/api/v1
ENV VITE_VIKUNJA_TOKEN=tk_2105ce43e5fd334f4c731201814751882977765f

# Otwórz port 80
EXPOSE 9090
