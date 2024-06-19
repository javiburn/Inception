#!/bin/sh

# Wait for the database to be ready
sleep 10
while ! mysqladmin ping -h"$WORDPRESS_DB_HOST" --silent; do
    echo "Waiting for MariaDB..."
    sleep 2
done

cd /var/www/html

# Download WordPress core files if not already present
if [ ! -f /var/www/html/wp-config.php ]; then
  wp core download --path=/var/www/html --allow-root
fi

if [ -f wp-config.php ]
then
    echo "WordPress already installed."
else
    echo "Creating wp-config.php..."
    wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --allow-root
    if [ $? -ne 0 ]; then
        echo "Failed to create wp-config.php"
        exit 1
    fi

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
    # Run any additional WP-CLI commands
    wp plugin install jetpack --activate --path=/var/www/html --allow-root
fi

echo "Starting WordPress..."

/usr/sbin/php-fpm7.4 --nodaemonize