#!/bin/sh

# install and enable docker-ce
curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
sh /tmp/get-docker.sh

# router-south-2
ip link set enp0s8 up
ip addr add 10.0.0.2/23 dev enp0s8

ip route add 10.0.4.0/25 via 10.0.0.1
ip route add 10.0.2.0/23 via 10.0.0.1

# run detached nginx-test docker container
docker run -d -p 80:80 dustnic82/nginx-test

