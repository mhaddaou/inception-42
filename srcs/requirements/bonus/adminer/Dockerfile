# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mhaddaou < mhaddaou@student.1337.ma>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/30 14:58:44 by mhaddaou          #+#    #+#              #
#    Updated: 2022/12/30 15:50:27 by mhaddaou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

LABEL maintainer="mhaddaou@student.1337.ma"

RUN apt update -y;  apt upgrade -y; apt install apache2 wget php libapache2-mod-php php-mysql -y; cd /var/www/html; rm -rf *;\
    wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php -O index.php;\
    sed -i  's/80/8080/g' /etc/apache2/ports.conf; service apache2 restart

CMD ["apachectl", "-D", "FOREGROUND"]