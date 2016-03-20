#!/bin/bash

echo "Provisioning virtual machine..."
echo "Adding needed repositories"
# add repository for java 8
sudo add-apt-repository ppa:webupd8team/java -y
# add the repo's source
echo "deb http://debian.datastax.com/datastax-ddc 3.3 main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
# add three public keys from the Apache Software Foundation associated with the package repositories
sudo curl -L https://debian.datastax.com/debian/repo_key | sudo apt-key add -

sudo apt-get update

echo "Installing Java"
# Automated installation (auto accept license)
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get install -y oracle-java8-installer

echo "Installing Cassandra"
sudo apt-get install -y datastax-ddc

echo "Hello I'm up and running"
echo "To check if cassandra is running execute the following:"
echo "sudo service cassandra status"
