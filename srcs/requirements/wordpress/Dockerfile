FROM debian:buster

LABEL maintainer=" mhaddaou@student.1337.ma"

EXPOSE 9000

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y php7.3-fpm php7.3-mysql mariadb-client curl sendmail
# RUN rm -rf /var/lib/apt/lists/*

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

ADD https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz
RUN cd /var/www/ && \
    tar -xvf latest.tar.gz && \
    rm -rf latest.tar.gz

RUN	curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp --silent
RUN	chmod +x ./usr/bin/wp

# RUN mkdir /run/php

COPY ./conf/script.sh ./script.sh
RUN chmod +x script.sh

CMD ["bash", "./script.sh"]
