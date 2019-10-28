export DEBIAN_FRONTEND=noninteractive

# exec the right provisioning script
/vagrant/scripts/ubuntu/prov_"$(uname -n)".sh
