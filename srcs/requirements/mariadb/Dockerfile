# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jsarabia <jsarabia@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/25 18:31:02 by jsarabia          #+#    #+#              #
#    Updated: 2024/04/23 16:58:57 by jsarabia         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

# Actualizar el índice de paquetes e instalar el servidor MariaDB
RUN apt-get update && apt-get install -y mariadb-server


# Copy initialization script and SQL file
COPY ./conf/db.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/script_db.sh /init_mysql.sh

# Make the script executable
RUN chmod +x /init_mysql.sh

# Create the required directory for the MySQL socket and set permissions
RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld && \
    mkdir -p /var/lib/mysql && chown mysql:mysql /var/lib/mysql; \
    touch /run/mysqld/mysql.sock

RUN mkdir /run/mysql

# Start MariaDB and run the initialization script
CMD ["/init_mysql.sh"]