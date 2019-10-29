#!/bin/sh

# router-south-2
ip link set dev eth1 up
ip addr add 10.0.0.1/23 dev eth1

# router-inter
ip link set dev eth2 up
ip addr add 10.0.4.130/25 dev eth2

# enable routing function
sysctl -w net.ipv4.ip_forward=1
ip route add 10.0.2.0/23 via 10.0.4.129 dev eth2
ip route add 10.0.4.0/25 via 10.0.4.129 dev eth2

