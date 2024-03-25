# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jsarabia <jsarabia@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/18 16:57:42 by jsarabia          #+#    #+#              #
#    Updated: 2024/03/25 18:13:50 by jsarabia         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

#COPY ... in case I wanted to copy files or directories from src and adds them to the filesystem oof the container at the path dest

RUN apt-get update && apt-get install -y wget zip && apt-get install -y php-fpm && apt-get clean

EXPOSE 9000

RUN cd /var/www/html; wget https://wordpress.org/latest.zip && unzip latest.zip; rm latest.zip

RUN chown -R www-data:www-data wordpress/ && cd wordpress/ \
    chmod -R 755 .

CMD ["php", "-S", "0.0.0.0:9000", "-t", "wordpress/"]