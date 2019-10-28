#!/bin/sh

# router-south-2
ip link set dev enp0s8 up
ip addr add 10.0.0.1/23 dev enp0s8

# router-inter
ip link set dev enp0s9 up
ip addr add 10.0.4.130/25 dev enp0s9

