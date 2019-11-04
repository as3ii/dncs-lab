#!/bin/sh

# host-b
printf "Enabling enp0s8\n"
ip link set dev enp0s8 up
printf "Adding ip: 10.0.2.2/23 to enp0s8\n"
ip addr add 10.0.2.2/23 dev enp0s8

printf "Adding route for 10.0.0.0/23 via 10.0.2.1\n"
ip route add 10.0.0.0/23 via 10.0.2.1

