# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jsarabia <jsarabia@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/18 16:57:42 by jsarabia          #+#    #+#              #
#    Updated: 2024/06/05 17:08:04 by jsarabia         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN mkdir /var/www/; mkdir /var/www/html; cd /var/www/html

# Install necessary packages
RUN apt-get update && apt-get install -y curl \
    php7.4 \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-common \
    mariadb-client \
    sendmail \
    wget \
    zip

# Install the CLI:
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --silent
RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

# Copy the initialization script
COPY tools/script_wp.sh /var/www/init_wp.sh

# Download and extract WordPress
RUN cd /var/www/html && \
    wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    rm latest.zip

# Set ownership and permissions
RUN chown -R www-data:www-data /var/www/html/wordpress && \
    chmod -R 755 /var/www/html/wordpress

# Ensure the init script is executable
RUN chmod +x /var/www/init_wp.sh

# Create the necessary directory for PHP-FPM
RUN mkdir -p /run/php

# Copy custom www.conf file
COPY config/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Set the default command
CMD ["/var/www/init_wp.sh"]