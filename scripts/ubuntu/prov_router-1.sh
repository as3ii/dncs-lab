#!/bin/sh

# router-south-1
printf "Enabling enp0s8\n"
ip link set dev enp0s8 up
printf "Adding ip: 10.0.4.1/25 to enp0s8\n"
ip addr add 10.0.4.1/25 dev enp0s8
printf "Adding ip: 10.0.2.1/23 to enp0s8\n"
ip addr add 10.0.2.1/23 dev enp0s8

# router-inter
printf "Enabling enp0s9\n"
ip link set dev enp0s9 up
printf "Adding ip: 10.0.4.129/30 to enp0s9\n"
ip addr add 10.0.4.129/30 dev enp0s9

# enable routing function
printf "Enabling ipv4 forwarding\n"
sysctl -w net.ipv4.ip_forward=1 > /dev/null
printf "Adding route for 10.0.0.0/23 via 10.0.4.130\n"
ip route add 10.0.0.0/23 via 10.0.4.130 dev enp0s9
