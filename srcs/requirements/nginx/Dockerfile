FROM debian:buster

LABEL maintainer="mhaddaou@student.1337.ma"

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install nginx -y
RUN apt-get install openssl -y
RUN rm -rf /var/lib/apt/lists/*

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

RUN openssl req -x509 -days 365 -nodes -newkey rsa:4096 \
    -keyout /etc/ssl/private/mhaddaou.key \
    -out /etc/ssl/certs/mhaddaou.crt -sha256 -subj "/CN=mhaddaou.42.fr"

CMD ["nginx", "-g", "daemon off;"]