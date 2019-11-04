export DEBIAN_FRONTEND=noninteractive

# exec the right provisioning script
UNAME=$(uname -n)
printf " -- Executing: prov_%s.sh --\n\n" "$UNAME"
/vagrant/scripts/ubuntu/prov_"$UNAME".sh
printf "\n -- END --\n"
