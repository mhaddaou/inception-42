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

FROM is a Dockerfile instruction that specifies the base image to use for building the Docker image. In this case, <br>
the instruction <h5>FROM debian:buster</h5> specifies that the Docker image should be based on the debian base image, specifically the buster version<br>

then add 
```console
    LABEL maintainer="mhaddaou@student.1337.ma"
```

LABEL is a Dockerfile instruction that allows you to add metadata to your Docker image. The metadata is stored in the form of key-value pairs and can be used to provide information about the image, such as the maintainer, version, and other details.<br>

In this case, the instruction LABEL maintainer="mhaddaou@student.1337.ma" adds a maintainer label to the image with the value mhaddaou@student.1337.ma. This label can be used to specify the email address of the maintainer of the image.<br>
