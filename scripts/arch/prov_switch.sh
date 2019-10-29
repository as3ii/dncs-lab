#!/bin/sh

pacman -S --noconfirm --needed --noprogressbar openvswitch
systemctl enable ovs-vswitchd
systemctl start ovs-vswitchd

#################################
#  Startup commands for switch  #
#################################

# create virtual switch
ovs-vsctl add-br switch

# add phisical interface

ovs-vsctl add-port switch eth1            # link to router-1
ovs-vsctl add-port switch eth2            # link to subnet Hosts-A
ovs-vsctl add-port switch eth3           # link to subnet Hosts-B

# enable interfaces and virtual switch
ip link set eth1 up   # router-sout-1
ip link set eth2 up   # host_a
ip link set eth3 up  # host_b
ip link set dev switch up

