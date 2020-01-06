# docker_ds_poc

A repository demonstrating how to use R and Python with docker

# Install docker

sudo apt install docker
sudo apt install docker-compose

# Setting up R

All the relevant files are in the subdirectory R

## Building a reporting image

The dockerfile to create the base image is located in the subdirectory R/image. Navigate to that directory on run the command:
```docker build -t markzwart76/r_reporting .```

## Bringing the container up

```sudo docker-compose -f docker-compose.yml up -d```

## Finding the container IDs
```sudo docker container ls```

## Stopping the containers
```sudo docker stop 606db0a3e85c```


# Setting up Python
