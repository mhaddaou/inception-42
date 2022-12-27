#!/bin/bash

cd /var/www/wordpress

wp core config --dbhost=$MYSQL_HOST \
				--dbname=$MYSQL_DATABASE \
				--dbuser=$MYSQL_USER \
				--dbpass=$MYSQL_PASSWORD \
				--allow-root

wp core install --title=$WORDPRESS_NAME \
				--admin_user=$WORDPRESS_ROOT_LOGIN \
				--admin_password=$WORDPRESS_ROOT_PASSWOR \
				--admin_email=$WORDPRESS_ROOT_EMAIL \
				--url=$DOMAIN_NAME \
				--allow-root

wp user create $MYSQL_USER $WORDPRESS_USER_EMAIL --role=author --user_pass=$MYSQL_PASSWORD --allow-root

/usr/sbin/php-fpm7.3 --nodaemonize --allow-to-run-as-root