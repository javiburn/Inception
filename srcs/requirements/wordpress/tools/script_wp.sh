#!/bin/sh

# Esperar a que la base de datos esté lista
sleep 10
while ! mysqladmin ping -h"$WORDPRESS_DB_HOST" --silent; do
    echo "Waiting for MariaDB..."
    sleep 2
done

cd /var/www/html

# Descargar los archivos principales de WordPress si aún no están presentes
if [ -f /var/www/html/wp-config.php ]; then
    echo "WordPress already installed."
else
    wp core download --path=/var/www/html --allow-root
    echo "Creating wp-config.php..."
    wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --allow-root
    if [ $? -ne 0 ]; then
        echo "Failed to create wp-config.php"
        exit 1
    fi

    # Añadir configuraciones de depuración al wp-config.php
    sed -i "/\/\* That's all, stop editing! Happy publishing. \*\//i \
    \n\
    /** Enable debugging for WordPress */\n\
    define('WP_DEBUG', true);\n\
    define('WP_DEBUG_LOG', true);\n\
    define('WP_DEBUG_DISPLAY', false);\n" /var/www/html/wp-config.php

    echo "Installing WordPress..."
    wp core install --url='jsarabia.42.fr' --title="Jsarabia's Site" --admin_user=$WORDPRESS_DB_ADMIN --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=fake@fake.com --allow-root
    if [ $? -ne 0 ]; then
        echo "Failed to install WordPress"
        exit 1
    fi

    echo "Creating additional user..."
    wp user create $WORDPRESS_USER faker@faker.com --role=editor --user_pass=$WORDPRESS_USER_PASSWORD --allow-root
    if [ $? -ne 0 ]; then
        echo "Failed to create additional user"
        exit 1
    fi

    # Ejecutar comandos adicionales de WP-CLI
    wp plugin install jetpack --activate --path=/var/www/html --allow-root
fi

echo "Starting WordPress..."

/usr/sbin/php-fpm7.4 --nodaemonize