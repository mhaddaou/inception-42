FROM debian:buster

RUN apt-get update && \
    apt-get install mariadb-server -y

EXPOSE 3306

COPY ./tools/create_db.sql /

RUN service mysql start && mysql -u root < /create_db.sql
RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d
 

ENTRYPOINT ["mysqld"]