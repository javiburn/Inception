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

# Install MariaDB and configure
RUN apt-get update && \
    apt-get install -y mariadb-server && \
    apt-get clean

# Copy initialization script and SQL file
COPY ./tools/script_db.sh ./init_mysql.sh
#COPY ./conf/db.cnf /etc/mysql/conf.d/mysql.cnf

# Make the script executable
RUN chmod +x ./init_mysql.sh

# Create the required directory for the MySQL socket and set permissions
RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld && \
    mkdir -p /var/lib/mysql && chown mysql:mysql /var/lib/mysql; \
    touch /run/mysqld/mysql.sock

# Start MariaDB and run the initialization script
CMD ["./init_mysql.sh"]