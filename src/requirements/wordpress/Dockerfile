# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jsarabia <jsarabia@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/18 16:57:42 by jsarabia          #+#    #+#              #
#    Updated: 2024/03/18 17:29:46 by jsarabia         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

#COPY ... in case I wanted to copy files or directories from src and adds them to the filesystem oof the container at the path dest

RUN apt-get update && apt-get install -y wordpress && apt-get clean

EXPOSE 80

#CMD ["nginx", "-g", "daemon off;"]