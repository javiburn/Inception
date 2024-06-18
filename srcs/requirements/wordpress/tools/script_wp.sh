#!/bin/sh

sleep 10

if [ -f ./wp-config.php ]
then
    echo "Wordpress already installed."
else
    echo "Downloading WordPress..."
    wp core download --allow-root

    echo "Creating wp-config.php..."
    wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --allow-root

    echo "Installing WordPress..."
    wp core install --url='jsarabia.42.fr' --title="Jsarabia's Site" --admin_user=$WORDPRESS_DB_ADMIN --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=fake@fake.com --allow-root

    echo "Creating additional user..."
    wp user create $WORDPRESS_USER faker@faker.com --role=editor --user_pass=$WORDPRESS_USER_PASSWORD --allow-root
fi

echo "Starting Wordpress..."

/usr/sbin/php-fpm7.4 --nodaemonize