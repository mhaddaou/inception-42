# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mhaddaou < mhaddaou@student.1337.ma>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/30 15:04:45 by mhaddaou          #+#    #+#              #
#    Updated: 2022/12/30 15:50:20 by mhaddaou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

LABEL maintainer="mhaddaou@student.1337.ma"

RUN apt update -y && apt upgrade -y && apt install redis -y && sed -i 's/# bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis/redis.conf

ENTRYPOINT redis-server --protected-mode no