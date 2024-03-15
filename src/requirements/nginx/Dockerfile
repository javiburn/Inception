# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jsarabia <jsarabia@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/15 18:26:50 by jsarabia          #+#    #+#              #
#    Updated: 2024/03/15 18:27:00 by jsarabia         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM nginx:latest

#COPY ... in case I wanted to copy files or directories from src and adds them to the filesystem oof the container at the path dest

COPY nginx.conf etc/nginx/nginx.conf

EXPOSE 80

#RUN ... in case I wanted to run a service inside a shell inside our container


CMD ["nginx", "-g", "daemon off;"]