#!/bin/sh

# install and enable docker-ce
pacman -S --needed --noconfirm --noprogressbar docker
systemctl enable docker
systemctl start docker

# router-south-2
ip link set eth1 up
ip addr add 10.0.0.2/23 dev eth1

ip route add 10.0.4.0/25 via 10.0.0.1
ip route add 10.0.2.0/23 via 10.0.0.1

# run detached nginx-test docker container
docker run -d -p 80:80 dustnic82/nginx-test

