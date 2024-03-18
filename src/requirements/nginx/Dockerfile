# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jsarabia <jsarabia@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/15 18:26:50 by jsarabia          #+#    #+#              #
#    Updated: 2024/03/18 16:12:46 by jsarabia         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

#COPY ... in case I wanted to copy files or directories from src and adds them to the filesystem oof the container at the path dest

RUN apt-get update && apt-get install -y nginx && apt-get clean

EXPOSE 80

COPY nginx.conf etc/nginx/nginx.conf


CMD ["nginx", "-g", "daemon off;"]