#!/bin/sh

# host-b
ip link add link enp0s8 name enp0s8.20 type vlan id 20
ip link set dev enp0s8 up
ip link set dev enp0s8.20 up
ip addr add 10.0.2.2/23 dev enp0s8.20

