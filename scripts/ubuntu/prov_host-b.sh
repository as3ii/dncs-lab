#!/bin/sh

# host-b
ip link set dev enp0s8 up
ip addr add 10.0.2.2/23 dev enp0s8

ip route add 10.0.0.0/23 via 10.0.2.1

