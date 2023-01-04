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

