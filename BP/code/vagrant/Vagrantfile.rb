# -*- mode: ruby -*-
# vi: set ft=ruby :

boxes = [
  { :name => 'cassandra-master', :ip => '192.168.33.10',
    :cpus =>2, :memory => 2048 },
  { :name => 'cassandra-node-1', :ip => '192.168.33.11',
    :cpus =>2, :memory => 2048 },
  { :name => 'cassandra-node-2', :ip => '192.168.33.12',
    :cpus =>2, :memory => 2048 },
  { :name => 'cassandra-node-3', :ip => '192.168.33.13',
    :cpus =>2, :memory => 2048 },
  { :name => 'cassandra-node-4', :ip => '192.168.33.14',
    :cpus =>2, :memory => 2048 }
]

# All Vagrant configuration is done below.
# The "2" in Vagrant.configure
# configures the configuration version
# (we support older styles for
# backwards compatibility).
# Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  boxes.each do |box|
    config.vm.define box[:name] do |config|

      # Specify the box
      config.vm.box = "ubuntu/trusty64"

      # Set ip
      config.vm.network :private_network, ip: box[:ip]

      # Manage /etc/hosts on host and VMs
      config.hostmanager.enabled = false
      config.hostmanager.manage_host = true
      config.hostmanager.include_offline = true
      config.hostmanager.ignore_private_ip = false

      # Set host name
      config.vm.hostname = box[:name]

      # Vagrant up message
      config.vm.post_up_message =
        box[:name] + " is alive and kicking"

      # Virtualbox config
      config.vm.provider "virtualbox" do |vb|
        # Customize the amount of memory on the VM:
        vb.memory = box[:memory]

        # Customize the amount of cpus on the VM:
        vb.cpus = box[:cpus]

        #Set Name of vm
        vb.name = box[:name]
      end

      #Copy hosts
      config.vm.provision :shell, :inline
        => "cp -fv /vagrant/hosts /etc/hosts"

      if (box[:name] == "cassandra-master")
        # Port forwarding
        config.vm.network "forwarded_port",
          guest: 8888, host: 8888

        #config.vm.provision :shell, :inline => $master_script
        config.vm.provision "shell",
          path: => "provision/setup_dse.sh"
      else
        #config.vm.provision :shell, :inline => $slave_script
        config.vm.provision :shell,
          :path => "provision/setup_slave.sh"
      end

      #hostmanager config
      config.vm.provision :hostmanager

    end
  end
end
