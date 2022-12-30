# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockefile                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mhaddaou < mhaddaou@student.1337.ma>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/29 12:55:23 by mhaddaou          #+#    #+#              #
#    Updated: 2022/12/29 12:55:39 by mhaddaou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

LABEL maintainer="mhaddaou@student.1337.ma"


EXPOSE 6379

RUN apt-get update -y
RUN apt full-upgrade -y

RUN apt-get install redis-server -y
RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/redis/redis.conf





COPY ./conf/script.sh ./script.sh
RUN chmod +x script.sh

CMD ["bash", "./script.sh"]