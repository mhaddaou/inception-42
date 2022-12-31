# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mhaddaou < mhaddaou@student.1337.ma>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/30 16:54:15 by mhaddaou          #+#    #+#              #
#    Updated: 2022/12/30 16:54:16 by mhaddaou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update -y; apt upgrade -y; apt install apache2 -y;\
     sed -i  's/80/81/g' /etc/apache2/ports.conf;

COPY ./site ./var/www/html

CMD ["apachectl", "-D", "FOREGROUND"]