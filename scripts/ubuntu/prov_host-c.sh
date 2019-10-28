#!/bin/sh

# router-south-2
ip link set enp0s8 up
ip addr add 10.0.0.2/23 dev enp0s8

