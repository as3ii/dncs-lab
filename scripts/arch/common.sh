#!/bin/sh

pacman -Sy
pacman -S --noconfirm --needed --noprogressbar tcpdump

# exec the right provisioning script
/vagrant/scripts/arch/prov_"$(uname -n)".sh

