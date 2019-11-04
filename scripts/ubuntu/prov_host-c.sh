#!/bin/sh

# install and enable docker-ce
#curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
#sh /tmp/get-docker.sh

printf "Installing docker\n"
apt-get -qq update
apt-get -qq install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get -qq update
apt-get -qq install docker-ce docker-ce-cli containerd.io


# router-south-2

printf "Enabling enp0s8\n"
ip link set enp0s8 up
printf "Adding ip: 10.0.0.2/23 for enp0s8\n"
ip addr add 10.0.0.2/23 dev enp0s8

printf "Adding route for 10.0.4.0/23 via 10.0.0.1\n"
ip route add 10.0.4.0/25 via 10.0.0.1
printf "Adding route for 10.0.2.0/23 via 10.0.0.1\n"
ip route add 10.0.2.0/23 via 10.0.0.1

# run detached nginx-test docker container
printf "Starting container 'nginx-test' demonized with binded port 80\n"
docker pull -q dustnic82/nginx-test
docker run -d -p 80:80 dustnic82/nginx-test

