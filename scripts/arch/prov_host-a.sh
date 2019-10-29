#!/bin/sh

# host-a
ip link set dev eth1 up
ip addr add 10.0.4.2/25 dev eth1

ip route add 10.0.0.0/23 via 10.0.4.1

