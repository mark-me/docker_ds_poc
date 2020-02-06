# docker_ds_poc

A repository demonstrating how to use R and Python with docker. 

## Assumptions

It is assumed there is a directory called data in the root with the following structure:

/
├/data
├─/customers    - 
├─/intermediate - 
├─/market_nl    - 

This data structure could be set up per product, but mapped to the same structure in the docker-compose of the product.

# Install docker

First we need to install all the docker and git related components:
```sudo apt install docker docker-compose git```

## Manage docker as a non-root user

If we want users to be able to handle containers without being a root user use the commands:
```sudo groupadd docker```
and
```sudo usermod -aG docker $USER```

## Setting up a docker registry

Create or modify /etc/docker/daemon.json

```{ "insecure-registries":["myregistry.example.com:5000"] }```
Restart docker daemon

```sudo service docker restart```

(Setting up private registry)[https://softwaretester.info/create-private-docker-registry-with-ui/]

# Clone this repository

To clone this repository locally
```git clone https://github.com/mark-me/docker_ds_poc.git```

# Setting up a R container

All the relevant files are in the subdirectory R. The main outline of the directory's structure is the following: 
/R
├ The R directory contains the docker compose 
├─/app        - This directory contains the scripts and docker file to create the report's container
├─/base_image - This directory contains all the necessities to create a base image, on which all other report images can be based

## Building a reporting base image

The dockerfile to create the base image is located in the subdirectory R/base_image. Navigate to that directory on run the command:
```docker build -t markzwart76/r_graydon_reporting:latest -t markzwart76/r_graydon_reporting:1.0 .```
This command will build two images: one with a specific version number, and one with the tag latest. 

## Developing the report app image

Find the server's IP address:
```ifconfig```

Find the right image ID for the reporting image
```docker image ls```

Start the base reporting image in development mode using the image ID:
```docker run -d -p 8787:8787 -e USER=graydon -e PASSWORD=graydon -v ~/docker_ds_poc/R/app:/home/graydon 2bd4659924f2```
or using docker compose:
```sudo docker-compose -f compose-develop.yml up -d```


Start up the browser and enter in the found IP with the port 8787, for example:
```http://172.26.23.105:8787/```

Clone the report repository you want to turn into production (do this in the app folder)


## Building the report app image


The report's scripts should be pulled in here from the report's Git. 
```docker build -t markzwart76/risk-analysis:latest -t markzwart76/risk-analysis:1.0 .```

```docker run -d -p 8787:8787 -e USER=graydon -e PASSWORD=graydon 2bd4659924f2```
```docker run -d -p 8787:8787 -e USER=graydon -e PASSWORD=graydon markzwart76/r_graydon_reporting```

### Bringing the container up

```sudo docker-compose -f docker-compose.yml up -d```

### Finding the container IDs
```sudo docker container ls```

### Stopping the containers
```sudo docker stop 606db0a3e85c```

## Building a reporting 'app' image

The dockerfile to create the base image is located in the subdirectory R/image. Navigate to that directory on run the command:
```docker build -t markzwart76/r_reporting .```

## Starting RStudio inside a container
```sudo docker run -d -p 3389:8787 -e PASSWORD=test --name markzwart76/r_reporting```

# Setting up Python
