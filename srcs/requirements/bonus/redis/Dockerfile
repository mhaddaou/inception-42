# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mhaddaou < mhaddaou@student.1337.ma>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/30 15:04:45 by mhaddaou          #+#    #+#              #
#    Updated: 2023/01/01 16:20:16 by mhaddaou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

LABEL maintainer="mhaddaou@student.1337.ma"

RUN apt update -y && apt upgrade -y && apt install redis -y && sed -i 's/# bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis/redis.conf
# When protected mode is disabled, Redis will accept connections from any client, regardless of IP address.
# This can be useful in certain scenarios, such as when you are running Redis in a development 
# environment and want to make it easier to connect to the server from any device.
ENTRYPOINT redis-server --protected-mode no