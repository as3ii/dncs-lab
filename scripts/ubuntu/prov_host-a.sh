#!/bin/sh

# host-a
ip link set dev enp0s8 up
ip addr add 10.0.4.2/25 dev enp0s8

ip route add default via 10.0.4.1

