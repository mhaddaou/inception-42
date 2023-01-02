# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mhaddaou < mhaddaou@student.1337.ma>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/02 09:23:51 by mhaddaou          #+#    #+#              #
#    Updated: 2023/01/02 09:30:01 by mhaddaou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

names=NGINX MARIADB WORDPRESS REDIS ADMINER WEBSITE
volumes= srcs_my_network srcs_wordpress_data srcs_mariadb_data srcs_adminer_data
path=/home/mhaddaou/
all:
	mkdir -p ${path}/data/
	mkdir -p ${path}/data/wp/
	mkdir -p ${path}/data/db/
	docker-compose -f ./srcs/docker-compose.yml up  --build
down:
	docker-compose -f ./srcs/docker-compose.yml down
clean: down
	docker rmi ${names}
	docker volume rm ${volumes}
	rm -rf ${path}/data
fclean:
	docker system prune --all -f
rmv:
	docker volume rm ${volumes}
	rm -rf ${path}/data