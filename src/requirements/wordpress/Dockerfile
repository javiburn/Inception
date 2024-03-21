# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jsarabia <jsarabia@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/18 16:57:42 by jsarabia          #+#    #+#              #
#    Updated: 2024/03/19 13:01:54 by jsarabia         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

#COPY ... in case I wanted to copy files or directories from src and adds them to the filesystem oof the container at the path dest

RUN apt-get update && apt-get install -y wget zip && apt-get install -y php && apt-get clean

EXPOSE 80

RUN wget -qO- https://wordpress.org/latest.tar.gz | tar -xz -C /var/www/html --strip-components=1

RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

CMD ["apache2ctl", "-D", "FOREGROUND"]