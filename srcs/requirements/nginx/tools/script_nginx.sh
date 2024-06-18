#! /bin/sh

# Create SSL certificates
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/jsarabia.42.fr.key \
    -out /etc/ssl/certs/jsarabia.42.fr.crt \
    -subj "/C=XX/ST=XX/L=XX/O=XX/OU=XX/CN=jsarabia.42.fr"
nginx -g 'daemon off;'