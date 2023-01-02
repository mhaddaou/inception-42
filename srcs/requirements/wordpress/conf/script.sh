# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    script.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mhaddaou < mhaddaou@student.1337.ma>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/29 12:57:34 by mhaddaou          #+#    #+#              #
#    Updated: 2023/01/01 15:12:27 by mhaddaou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

cd /var/www/wordpress
chown -R www-data:www-data /var/www/wordpress

#This command will create a new wp-config.php
wp core config --dbhost=$MYSQL_HOST \
                --dbname=$MYSQL_DATABASE \
                --dbuser=$MYSQL_USER \
                --dbpass=$MYSQL_PASSWORD \
                --allow-root
#before use this command you will need to have a wordpress database configured
wp core install --title=$WORDPRESS_NAME \
                --admin_user=$WORDPRESS_ROOT_LOGIN \
                --admin_password=mhaddaou1337 \
                --admin_email=$WORDPRESS_ROOT_EMAIL \
                --url=$DOMAIN_NAME \
                --allow-root

wp user create $MYSQL_USER $WORDPRESS_USER_EMAIL --role=author --user_pass=$MYSQL_PASSWORD --allow-root

# wp option update WP_ALLOW_REPAIR true
wp config set WP_ALLOW_REPAIR "true" --allow-root
# is used to enable the WordPress object cache
wp config set WP_CACHE --raw "true" --allow-root
#is used to specify the hostname or IP address of the Redis server that is used by the WordPress object cache.
wp config set WP_REDIS_HOST "REDIS" --allow-root

wp config set WP_REDIS_PORT --raw "6379" --allow-root
# is used to specify the maximum time in seconds that the WordPress object cache will wait for 
# a response from the Redis server before timing out.
wp config set WP_REDIS_TIMEOUT --raw "1" --allow-root
#is used to specify the maximum time in seconds that the WordPress object cache will wait for 
#a response from the Redis server when reading data before timing out.
wp config set WP_REDIS_READ_TIMEOUT --raw "1" --allow-root
# is used to specify the Redis database number that the WordPress object cache should use.
# By default, Redis uses database 0.
wp config set WP_REDIS_DATABASE --raw "0" --allow-root

# the file /var/run/php/ will be created automatically when you run php service
service php7.3-fpm start

wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root
# i Stop php cause the next command cannot use the port 9000
service php7.3-fpm stop

php-fpm7.3 -F

