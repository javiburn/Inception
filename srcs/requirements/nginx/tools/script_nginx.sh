#! /bin/sh

# Create SSL certificates
openssl req -x509 -sha256 -days 356 -nodes -newkey rsa:2048 -subj "/CN=$DOMAIN_NAME/C=EU/L=Madrid" -keyout /etc/ssl/rootjsarabia.key -out etc/ssl/rootjsarabia.crt
envsubst '$DOMAIN_NAME'< /etc/nginx/conf.d/default.conf > /etc/nginx/conf.d/nginx.conf
nginx -g 'daemon off;'