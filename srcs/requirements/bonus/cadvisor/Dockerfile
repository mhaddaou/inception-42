# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mhaddaou < mhaddaou@student.1337.ma>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/04 12:29:27 by mhaddaou          #+#    #+#              #
#    Updated: 2023/01/04 12:29:34 by mhaddaou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update -y; apt upgrade -y; apt install curl -y;\
    curl -L https://github.com/google/cadvisor/releases/download/v0.37.5/cadvisor -o /usr/bin/cadvisor;\
    chmod +x /usr/bin/cadvisor

ENTRYPOINT cadvisor -logtostderr --port=2000