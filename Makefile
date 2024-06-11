# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jsarabia <jsarabia@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/13 18:25:00 by jsarabia          #+#    #+#              #
#    Updated: 2024/06/05 15:56:15 by jsarabia         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = Inception

all: build

build:
	@docker-compose -f srcs/docker-compose.yml build

up:
	@docker-compose -f srcs/docker-compose.yml up -d

down:
	@docker-compose -f srcs/docker-compose.yml down

re: down build up
