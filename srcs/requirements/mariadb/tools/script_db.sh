#!/bin/bash

# Start the service MySQL:
service mysql start

# Create the table if it does not exist already:
mysql -e "CREATE DATABASE IF NOT EXISTS \`${WORDPRESS_DB_NAME}\`;"

# Create a user that can manipulate the table if it does not exist already:
mysql -e "CREATE USER IF NOT EXISTS \`${WORDPRESS_DB_USER}\`@'localhost' IDENTIFIED BY '${WORDPRESS_USER_PASSWORD}';"

# Grants all rights to the new user created to manipulate the database
mysql -e "GRANT ALL PRIVILEGES ON \`${WORDPRESS_DB_NAME}\`.* TO \`${WORDPRESS_DB_USER}\`@'%' IDENTIFIED BY '${WORDPRESS_USER_PASSWORD}';"

# Change the password of the root:
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${WORDPRESS_USER_PASSWORD}';"

# Flushes so that it refreshes and MYSQL takes the changes into account:
mysql -e "FLUSH PRIVILEGES;"

# Restarts MYSQL for the changes to take effect:
mysqladmin -u root -p$WORDPRESS_USER_PASSWORD shutdown
exec mysqld_safe