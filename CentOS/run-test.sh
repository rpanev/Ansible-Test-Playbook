#!/bin/bash
DCKER_CONTAINER_NAME="ansible-test"

docker build -t centos8 .

docker run --tmpfs /run -v /sys/fs/cgroup:/sys/fs/cgroup:ro -ti --privileged --name $DCKER_CONTAINER_NAME -d -p 5000:22 centos8 /sbin/init

ansible-playbook -i local_docker setup-centos.yml --tags apache2 -vvv

docker stop $DCKER_CONTAINER_NAME
docker rm $DCKER_CONTAINER_NAME

#docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q) && docker rmi $(docker images -q) -f && docker volume prune -f