#!/bin/sh

# host-a
printf "Enabling enp0s8\n"
ip link set dev enp0s8 up
printf "Adding ip: 10.0.4.2/25 to enp0s8\n"
ip addr add 10.0.4.2/25 dev enp0s8

printf "Adding route for 10.0.0.0/23 via 10.0.4.1\n"
ip route add 10.0.0.0/23 via 10.0.4.1

