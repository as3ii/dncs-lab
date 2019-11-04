export DEBIAN_FRONTEND=noninteractive

printf "Installing openvswitch\n"
apt-get -qq update
apt-get -qq install -y tcpdump
apt-get -qq install -y openvswitch-common openvswitch-switch apt-transport-https ca-certificates curl software-properties-common

#################################
#  Startup commands for switch  #
#################################

# create virtual switch
printf "Creating virtual switch\n"
ovs-vsctl add-br switch

# add phisical interface
printf "Adding ports enp0s{8,9,10} to switch\n"
ovs-vsctl add-port switch enp0s8            # link to router-1
ovs-vsctl add-port switch enp0s9            # link to subnet Hosts-A
ovs-vsctl add-port switch enp0s10           # link to subnet Hosts-B

# enable interfaces and virtual switch
printf "Enabling ports and virtual switch\n"
ip link set enp0s8 up   # router-sout-1
ip link set enp0s9 up   # host_a
ip link set enp0s10 up  # host_b
ip link set dev switch up

