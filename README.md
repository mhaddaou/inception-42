# inception 42 tutorial 

This project aims to broaden your knowledge of system administration by using Docker.
You will virtualize several Docker images, creating them in your new personal virtual
machine.

#  General guidelines

• This project need to be done on a Virtual Machine.
• All the files required for the configuration of your project must be placed in a srcs
folder.<br>
• A Makefile is also required and must be located at the root of your directory. It
must set up your entire application (i.e., it has to build the Docker images using
docker-compose.yml).<br>
• This subject requires putting into practice concepts that, depending on your background, you may not have learned yet. Therefore, we advise you not to hesitate to
read a lot of documentation related to Docker usage, as well as anything else you
will find helpful in order to complete this assignment.<br>

# let's start with what is Docker

Docker is a tool designed to make it easier to create, deploy, and run applications by using containers. Containers allow a developer to package up an application with all of the parts it needs, such as libraries and other dependencies, and ship it all out as one package.<br>

By using containers, developers can be sure that their applications will run consistently on any system, regardless of the differences in setup and configuration between systems. This makes it easier to develop and test applications, and to deploy them to production environments.<br>

Docker is widely used in the development and deployment of modern applications and microservices. It allows developers to build, ship, and run their applications in a container, which can be easily moved between different systems. This makes it easier to scale and manage applications, and to deploy updates and new features quickly and reliably.<br>

# Installation

### Linux

```console
    sudo apt update

    sudo apt install -y docker.io
    
    sudo systemctl enable docker --now
    
    docker -v
```
# what is containers

A container is a standardized unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another. Containers are a way to package and distribute software in a portable and isolated environment, so that it can be run on any system that has the necessary support for containers.<br>

Containers are similar to virtual machines, but they do not include the entire operating system and hardware virtualization layers. This makes them more lightweight and efficient, and allows them to be more easily moved between systems.<br>
# diference between container and virtual machine
containers are lightweight and efficient, and they allow multiple applications to share the same host operating system and kernel. VMs, on the other hand, provide a higher level of isolation, but they are more resource-intensive and require their own copy of the operating system and kernel.<br>


# what is a Dockerfile

A Dockerfile is a text file that contains instructions for building a Docker image. It is used to automate the process of building a Docker image, and it specifies all the steps required to create a Docker image for an application, including installing required dependencies, copying application files, and setting up any necessary configuration.<br>

To build a Docker image, you create a Dockerfile and use the docker build command to build the image. The docker build command reads the instructions in the Dockerfile and executes them, creating a new Docker image. This image can then be used to create Docker containers, which are lightweight and portable environments that contain all the dependencies and code needed to run an application.<br>

# volumes
In Docker, a volume is a persistent storage location that is stored outside of a container's union file system and is used to store data that needs to persist beyond the life of a single container. Volumes can be shared and reused among containers, and they are stored in a part of the host file system that is managed by Docker.<br>

# Network

In Docker, a network is a virtual network that allows containers to communicate with each other and with the host system. Docker supports several types of networks, including bridge, host, and overlay networks.<br>

### Bridge Network

A bridge network is a virtual network that is created automatically when you install Docker. It allows containers on the same host to communicate with each other and with the host system. By default, all containers are connected to the bridge network, and you can use it to connect containers together and to the host system.<br>
### Host Network

A host network is a network that uses the host system's network stack and bypasses the virtual network entirely. This means that the containers on the host network are directly connected to the host system and are not isolated from it.<br>

### Overlay Network

An overlay network is a virtual network that spans multiple Docker hosts and allows containers on different hosts to communicate with each other. Overlay networks are used in Docker Swarm mode to allow containers to communicate across multiple nodes in a cluster.<br>


# let's set up a Docker container that contains NGINX with TLSv1.3 only.

first step make a file called Dockerfile then open it and write inside it.<br>

```console
FROM debian:buster
```

`FROM` : is a Dockerfile instruction that specifies the base image to use for building the Docker image. In this case, <br>
the instruction <h5>FROM debian:buster</h5> specifies that the Docker image should be based on the debian base image, specifically the buster version<br>

then add 
```console
    LABEL maintainer="mhaddaou@student.1337.ma"
```

`LABEL` : is a Dockerfile instruction that allows you to add metadata to your Docker image. The metadata is stored in the form of key-value pairs and can be used to provide information about the image, such as the maintainer, version, and other details.<br>

In this case, the instruction LABEL maintainer="mhaddaou@student.1337.ma" adds a maintainer label to the image with the value mhaddaou@student.1337.ma. This label can be used to specify the email address of the maintainer of the image.<br>
then add to our file
```console
    RUN apt-get update -y
    RUN apt-get upgrade -y
    RUN apt-get install nginx -y
    RUN apt-get install openssl -y
```
`RUN` : is a Dockerfile instruction that is used to execute commands during the build process of a Docker image<br>
`-y` : flag tells the package manager to assume that the user wants to install the packages and dependencies without prompting for confirmation.

`NGINX` is open source software for web serving, reverse proxying, caching, load balancing, media streaming, and more. It started out as a web server designed for maximum performance and stability. In addition to its HTTP server capabilities, NGINX can also function as a proxy server for email (IMAP, POP3, and SMTP) and a reverse proxy and load balancer for HTTP, TCP, and UDP servers.<br>
`openssl` is an open-source implementation of the Secure Sockets Layer (SSL) and Transport Layer Security (TLS) protocols. It is a widely used toolkit for implementing cryptographic protocols, such as SSL and TLS, in applications that need secure communication over networks.<br>
then add this command 
```console
    RUN openssl req -x509 -days 365 -nodes -newkey rsa:4096 \
    -keyout /etc/ssl/private/mhaddaou.key \
    -out /etc/ssl/certs/mhaddaou.crt -sha256 -subj "/CN=mhaddaou.42.fr"
```
This command generates a self-signed SSL/TLS certificate. It does the following:

`req` creates and processes certificate requests<br>
`-x509` specifies that a self-signed certificate should be created<br>
`-days 365` specifies that the certificate will be valid for 365 days<br>
`-nodes` specifies that the private key should not be encrypted<br>
`-newkey` rsa:4096: creates a new 4096-bit RSA key<br>
`-keyout /etc/ssl/private/mhaddaou.key` specifies the file to which the private key should be written<br>
`-out /etc/ssl/certs/mhaddaou.crt` specifies the file to which the certificate should be written<br>
`-sha256` specifies that the SHA-256 message digest algorithm should be used to sign the certificate<br>
`-subj` "/CN=mhaddaou.42.fr": specifies the subject of the certificate in the form of a Distinguished Name (DN). The /CN attribute specifies the Common Name (CN) of the certificate, which should be the domain name that the certificate will be used for. In this case, the certificate will be used for the domain mhaddaou.42.fr<br>
This command creates a self-signed SSL/TLS certificate and private key, and writes them to the specified files. The certificate is valid for 365 days and uses the SHA-256 message digest algorithm to sign it. The private key is 4096 bits long and is not encrypted. The certificate is intended to be used for the domain mhaddaou.42.fr.<br>

then add 
```console 
COPY ./conf/nginx.conf /etc/nginx/sites-available/default
CMD ["nginx", "-g", "daemon off;"]
```
`COPY ./conf/nginx.conf /etc/nginx/sites-available/default` This command copies the file nginx.conf from the conf directory in the current directory to the location /etc/nginx/sites-available/default. The file nginx.conf is typically a configuration file for the Nginx web server. When you copy it to the location /etc/nginx/sites-available/default, it will be used as the default configuration file for Nginx.<br>

The sites-available directory is typically used to store configuration files for virtual host configurations in Nginx. A virtual host is a way to host multiple websites on a single machine. The default file in the sites-available directory is usually used as a catch-all configuration for requests that do not match any of the other virtual host configurations.<br>

By copying the nginx.conf file to this location, you are effectively replacing the default configuration for Nginx with the new configuration contained in the nginx.conf file.<br>
`CMD` is a directive that specifies the command that should be run when the container is started. It is used to specify the default command that should be run when the container is started, and it can be overridden by the command specified when the container is run.<br>
`CMD ["nginx", "-g", "daemon off;"]` This command specifies the command that should be run when the container is started. It runs the nginx command with the arguments -g, daemon off;.

The nginx command is the command-line utility for the Nginx web server. It is used to start, stop, and reload the Nginx web server, as well as to perform other tasks related to the Nginx web server.

The `-g` option is used to specify global directives that should be applied to the main Nginx configuration file. The `daemon off;` directive specifies that Nginx should run in the foreground and not as a daemon.<br>

Now let's configue the file `nginx.conf` first step make a directory called `conf` and inside it make a file called `nginx.conf`
then open the file and write inside it<br>

```console 
 server {
    listen 443 ssl;
    listen [::]:443 ssl;

    server_name mhaddaou.42.fr www.mhaddaou.42.fr;

    ssl_certificate /etc/ssl/certs/mhaddaou.crt;
    ssl_certificate_key /etc/ssl/private/mhaddaou.key;
    
    ssl_protocols TLSv1.3;
    }
```
`listen 443 ssl;` tells the web server to listen on port 443 for HTTPS requests using SSL/TLS. This is the default port for HTTPS traffic.<br>
`[::]:443` syntax specifies that the web server should listen on all available IPv6 addresses on port 443. This is equivalent to specifying 0.0.0.0:443 for IPv4 addresses.<br>
`server_name` directive is used to specify the names of the virtual servers that the Nginx web server should listen to. It is usually included in the configuration file of a virtual host.<br>
the directive specifies that the virtual server should listen to requests for the domain `mhaddaou.42.fr` and its subdomain `www.mhaddaou.42.fr`<br>
`ssl_certificate` should be your primary certificate combined with the intermediate certificate that you made in the previous step (e.g., your_domain_name.crt).<br>

`ssl_certificate_key` should be the .key file generated when you created the CSR.<br>
`ssl_protocols` directive is used to specify which SSL/TLS protocol versions should be enabled on a virtual host in Nginx. SSL/TLS is a security protocol that is used to encrypt data transmitted between a client and a server.<br>

In this particular example, the directive specifies that only the TLSv1.3 protocol should be enabled. TLS (Transport Layer Security) is a successor to the SSL (Secure Sockets Layer) protocol and is used to secure the transmission of data on the internet.<br>

`TLSv1.3` is the latest version of the TLS protocol and offers improved security compared to previous versions. It is designed to be more resistant to attacks and provides better performance.<br>

# HOW TO RUN DOCKER WITHOUT SUDO
To run Docker commands without using sudo, you need to add your user to the docker group. This can be done with the following steps:

1. Create the docker group if it does not exist:

```console
sudo groupadd docker
```
2. Add your user to the docker group:
```console
sudo usermod -aG docker $USER
```
3. Log out and log back in to apply the changes to your user.<br>
# Before Run This Container we need to edit some files  
### First file
path : /etc/hosts<br>
go inside it and down of line => 127.0.0.1  localhost<br>
add  this
```console
127.0.1.1   yourdomainename.fr
```
### Second File
path : /etc/hostname
chane your hostname to your domain name<br>
this command will change your hostname<br>
```console
sudo hostname yourdomainname.fr
```
