# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    script.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mhaddaou < mhaddaou@student.1337.ma>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/29 12:56:05 by mhaddaou          #+#    #+#              #
#    Updated: 2022/12/29 12:56:17 by mhaddaou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

redis-server /etc/redis/redis.conf --daemonize yes

redis-cli monitor
