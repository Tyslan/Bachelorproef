#!/bin/bash

echo "Provisioning virtual machine..."
echo "Adding needed repositories"
# add repository for java 8
sudo add-apt-repository ppa:webupd8team/java -y

# add the repo's source
echo "deb http://debian.datastax.com/community stable main" | sudo tee -a /etc/apt/sources.list.d/datastax.community.list
wget -q -O - http://debian.datastax.com/debian/repo_key | sudo apt-key add -

echo "Updating repositories"
sudo apt-get update -qq

echo "Installing Java"
# Automated installation (auto accept license)
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections >> /dev/null
sudo apt-get install -y oracle-java8-installer >> /dev/null

echo "Installing OpsCenter"
sudo apt-get install -y opscenter >> /dev/null

echo "Starting opscenter"
sudo service opscenterd start
