# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|

  config.vm.hostname = "vagrantbase.localhost"
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_check_update = false
  config.vm.network "private_network", ip: "192.168.30.10"
  config.vm.synced_folder "./src", "/home/vagrant/src"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 3306, host: 3306

  config.vm.provision "init",  type: "shell", path: 'shellscripts/init.sh' 
  config.vm.provision "mysql", type: "shell", path: 'shellscripts/mysql.sh' 
  config.vm.provision "node",  type: "shell", path: 'shellscripts/node.sh' 
  #config.vm.provision "yarn",  type: "shell", path: 'shellscripts/yarn.sh' 

  config.vm.provider "virtualbox" do |vb|
    vb.name = 'base-2019-vagrant'
    vb.cpus = 2
    vb.memory = "1024"
  end
 
  
end
