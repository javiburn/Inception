#!/bin/sh

# Wait for the database to be ready
sleep 10

cd /var/www/html

# Download WordPress core files if not already present

if [ -f /var/www/html/wp-config.php ]
then
    echo "WordPress already installed."
else
    wp core download --path=/var/www/html --allow-root
    echo "Creating wp-config.php..."
    wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --allow-root
    if [ $? -ne 0 ]; then
        echo "Failed to create wp-config.php"
        exit 1
    fi

    echo "Installing WordPress..."
    wp core install --url='jsarabia.42.fr' --title="Jsarabia's Site" --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=fake@fake.com --allow-root
    if [ $? -ne 0 ]; then
        echo "Failed to install WordPress"
        exit 1
    fi

    wp user create $WORDPRESS_USER faker@faker.com --user_pass=$WORDPRESS_USER_PASSWORD --allow-root
    echo "Creating additional user..."
    if [ $? -ne 0 ]; then
        echo "Failed to create additional user"
        exit 1
    fi
fi

echo "Starting WordPress..."

/usr/sbin/php-fpm7.4 --nodaemonize