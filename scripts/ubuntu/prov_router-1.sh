#!/bin/sh

# router-south-1
ip link add link enp0s8 name enp0s8.10 type vlan id 10
ip link add link enp0s8 name enp0s8.20 type vlan id 20
ip link set dev enp0s8 up
ip link set dev enp0s8.10 up
ip link set dev enp0s8.20 up
ip addr add 10.0.4.1/25 dev enp0s8.10
ip addr add 10.0.2.1/23 dev enp0s8.20

# router-inter
ip link set dev enp0s9 up
ip addr add 10.0.4.129/25 dev enp0s9

# enable routing function
sysctl -w net.ipv4.ip_forward=1
ip route add 10.0.0.0/23 via 10.0.4.130 dev enp0s9

