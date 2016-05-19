# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  # Specify box
  config.vm.box = "ubuntu/trusty64"

  # forward ssh port
  config.vm.network :forwarded_port, guest: 22, host: 2250, id: "ssh"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|

    # Customize the amount of memory on the VM:
    vb.memory = "1024"

    #Set Name of vm
    vb.name = "Cassandra-Single-Node"
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", path: "provision/setup.sh"
end
