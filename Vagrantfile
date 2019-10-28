# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box_check_update = false
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--usb", "on"]
    vb.customize ["modifyvm", :id, "--usbehci", "off"]
    vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
    vb.customize ["modifyvm", :id, "--nicpromisc3", "allow-all"]
    vb.customize ["modifyvm", :id, "--nicpromisc4", "allow-all"]
    vb.customize ["modifyvm", :id, "--nicpromisc5", "allow-all"]
    vb.customize ["modifyvm", :id, "--natnet1", "10.1.0.0/24"]
  end
  config.vm.define "router-1" do |router1|
    router1.vm.box = "ubuntu/bionic64"
    router1.vm.hostname = "router-1"
    router1.vm.network "private_network", virtualbox__intnet: "broadcast_router-south-1", auto_config: false
    router1.vm.network "private_network", virtualbox__intnet: "broadcast_router-inter", auto_config: false
    router1.vm.provision "shell", path: "scripts/ubuntu/common.sh"
    router1.vm.provider "virtualbox" do |vb|
      vb.name = "router-1"
      vb.cpus = 1
      vb.memory = 256
      vb.gui = false
    end
  end
  config.vm.define "router-2" do |router2|
    router2.vm.box = "ubuntu/bionic64"
    router2.vm.hostname = "router-2"
    router2.vm.network "private_network", virtualbox__intnet: "broadcast_router-south-2", auto_config: false
    router2.vm.network "private_network", virtualbox__intnet: "broadcast_router-inter", auto_config: false
    router2.vm.provision "shell", path: "scripts/ubuntu/common.sh"
    router2.vm.provider "virtualbox" do |vb|
      vb.name = "router-2"
      vb.cpus = 1
      vb.memory = 256
      vb.gui = false
    end
  end
  config.vm.define "switch" do |switch|
    switch.vm.box = "ubuntu/bionic64"
    switch.vm.hostname = "switch"
    switch.vm.network "private_network", virtualbox__intnet: "broadcast_router-south-1", auto_config: false
    switch.vm.network "private_network", virtualbox__intnet: "broadcast_host_a", auto_config: false
    switch.vm.network "private_network", virtualbox__intnet: "broadcast_host_b", auto_config: false
    switch.vm.provision "shell", path: "scripts/ubuntu/common.sh"
    switch.vm.provider "virtualbox" do |vb|
      vb.name = "switch"
      vb.cpus = 1
      vb.memory = 256
      vb.gui = false
    end
  end
  config.vm.define "host-a" do |hosta|
    hosta.vm.box = "ubuntu/bionic64"
    hosta.vm.hostname = "host-a"
    hosta.vm.network "private_network", virtualbox__intnet: "broadcast_host_a", auto_config: false
    hosta.vm.provision "shell", path: "scripts/ubuntu/common.sh"
    hosta.vm.provider "virtualbox" do |vb|
      vb.name = "host-a"
      vb.cpus = 1
      vb.memory = 256
      vb.gui = false
    end
  end
  config.vm.define "host-b" do |hostb|
    hostb.vm.box = "ubuntu/bionic64"
    hostb.vm.hostname = "host-b"
    hostb.vm.network "private_network", virtualbox__intnet: "broadcast_host_b", auto_config: false
    hostb.vm.provision "shell", path: "scripts/ubuntu/common.sh"
    hostb.vm.provider "virtualbox" do |vb|
      vb.name = "host-b"
      vb.cpus = 1
      vb.memory = 256
      vb.gui = false
    end
  end
  config.vm.define "host-c" do |hostc|
    hostc.vm.box = "ubuntu/bionic64"
    hostc.vm.hostname = "host-c"
    hostc.vm.network "private_network", virtualbox__intnet: "broadcast_router-south-2", auto_config: false
    hostc.vm.provision "shell", path: "scripts/ubuntu/common.sh"
    hostc.vm.provider "virtualbox" do |vb|
      vb.name = "host-c"
      vb.cpus = 1
      vb.memory = 512
      vb.gui = false
    end
  end
end
