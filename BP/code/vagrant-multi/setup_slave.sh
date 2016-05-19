#!/bin/bash

echo "Provisioning virtual machine..."
echo "Adding needed repositories"
# add repository for java 8
sudo add-apt-repository ppa:webupd8team/java -y

echo "Updating repositories"
sudo apt-get update -qq

echo "Installing Java"
# Automated installation (auto accept license)
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get install -y oracle-java8-installer >> /dev/null
