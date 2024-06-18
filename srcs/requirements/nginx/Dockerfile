# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jsarabia <jsarabia@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/15 18:26:50 by jsarabia          #+#    #+#              #
#    Updated: 2024/04/17 12:19:11 by jsarabia         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

COPY ./tools/script_nginx.sh .

RUN apt-get update; \
    apt-get install -y nginx;\
    apt-get install -y openssl;\
    apt-get install gettext-base;\
    chmod 755 ./script_nginx.sh;

COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf

# Create directories for SSL certificates
RUN mkdir -p /etc/ssl/certs /etc/ssl/private

RUN chmod +x script_nginx.sh

CMD ["./script_nginx.sh"]