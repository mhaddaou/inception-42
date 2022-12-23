FROM debian:latest

RUN apt-get update && apt-get install -y nginx &&\
    apt-get install openssl -y

RUN rm /etc/nginx/sites-available/default

COPY default /etc/nginx/sites-available

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/mhaddaou.key -out /etc/ssl/certs/mhaddaou.crt -subj "/C=MA/ST=Khouribga/L=Khouribga/O=Inception/OU=IT/CN=localhost/emailAddress=mhaddaou@student.1337.ma"


EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]