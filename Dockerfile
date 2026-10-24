FROM nginx:1.28-alpine

RUN apk upgrade --no-cache

COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80