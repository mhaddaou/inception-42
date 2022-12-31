#!/bin/bash

service mysql start

mysql -u root -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -e "CREATE DATABASE ${MYSQL_DATABASE};"
mysql -u root -e "USE '${MYSQL_DATABASE}'; GRANT ALL PRIVILEGES ON * TO '${MYSQL_USER}'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"
mysql -u root -e "alter user 'root'@'localhost' identified by '${WORDPRESS_ROOT_PASSWORD}';"
