#!/bin/sh

# host-a
ip link add link enp0s8 name enp0s8.10 type vlan id 10
ip link set dev enp0s8 up
ip link set dev enp0s8.10 up
ip addr add 10.0.4.2/25 dev enp0s8.10

