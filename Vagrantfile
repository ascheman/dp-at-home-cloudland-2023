# -*- mode: ruby -*-
# vi: set ft=ruby :

name = ENV['VAGRANT_NAME'] || "devops-productivity-demo-ubuntu"
# Memory settings for "minimal" environment
memory = ENV['VAGRANT_MEMORY'] || 2148
ip_unique = ENV['VAGRANT_IP_UNIQUE'] || "23"
port_unique = ENV['VAGRANT_PORT_UNIQUE'] || ip_unique
box = ENV['VAGRANT_BOX'] || "bento/ubuntu-22.04"

Vagrant.configure("2") do |boxname|
  # Generic/Defaults
  boxname.vm.box = box
  boxname.vm.hostname = name
  # Mount-Sync this explicitely - otherwise some boxes will only rsync the folder
  boxname.vm.synced_folder ".", "/vagrant"
  boxname.vm.synced_folder "cache/apt-archives", "/var/cache/apt/archives"
  # boxname.vm.synced_folder "cache/snapd", "/var/cache/snapd"

  boxname.vm.provider "virtualbox" do |vbox, override|
    vbox.name = name
    vbox.memory = memory
    # Cf. https://github.com/chef/bento/issues/682 for bento/ubuntu 2.3.x boxes
    vbox.customize ["modifyvm", :id, "--cableconnected1", "on"]
    # override.vm.network "private_network", ip: "192.168.50.#{ip_unique}", virtualbox__intnet: true
    # SSH
    override.vm.network "forwarded_port", guest: 22, host: "#{port_unique}022"
  end

  boxname.vm.provision "shell", path: "install-tools.sh"
end
