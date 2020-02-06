#!/bin/bash

DOCKER_CONTAINER_NAME="ansible-test"

docker build -t ubuntu18 .

docker run -ti --privileged --name $DOCKER_CONTAINER_NAME -d -p 5000:22 ubuntu18

ansible-playbook -i env/local_docker install.yml -vvv

docker stop $DOCKER_CONTAINER_NAME

docker rm $DOCKER_CONTAINER_NAME