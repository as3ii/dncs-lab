export DEBIAN_FRONTEND=noninteractive
apt-get -q update
apt-get -q install -y tcpdump
apt-get -q install -y openvswitch-common openvswitch-switch apt-transport-https ca-certificates curl software-properties-common

#################################
#  Startup commands for switch  #
#################################

# create virtual switch
ovs-vsctl add-br switch

# add phisical interface

ovs-vsctl add-port switch enp0s8            # trunk link to router-1
ovs-vsctl add-port switch enp0s9 #tag=10     # tagget subnet Hosts-A
ovs-vsctl add-port switch enp0s10 #tag=20    # tegged subnet Hosts-B

# enable interfaces and virtual switch
ip link set enp0s8 up   # router-sout-1
ip link set enp0s9 up   # host_a
ip link set enp0s10 up  # host_b
ip link set dev switch up

