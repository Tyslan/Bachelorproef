#!/bin/bash

echo "Provisioning slave..."
echo "Adding needed repositories"
# add repository for java 8
sudo add-apt-repository ppa:webupd8team/java -y
# add the repo's source
echo "deb http://www.apache.org/dist/cassandra/debian 30x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
# add three public keys from the Apache Software Foundation associated with the package repositories
gpg --keyserver pgp.mit.edu --recv-keys F758CE318D77295D
sudo gpg --export --armor F758CE318D77295D | sudo apt-key add -
gpg --keyserver pgp.mit.edu --recv-keys 2B5C1B00
sudo gpg --export --armor 2B5C1B00 | sudo apt-key add -
gpg --keyserver pgp.mit.edu --recv-keys 0353B12C
sudo gpg --export --armor 0353B12C | sudo apt-key add -

sudo apt-get update

echo "Installing Java"
# Automated installation (auto accept license)
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get install -y oracle-java8-installer

echo "Installing Cassandra"
sudo apt-get install cassandra -yf

sudo service cassandra stop

sed -i 's/seeds: \"\"/seeds: \"192.168.50.100\"/' /etccassandra/cassandra.yaml
sed -i 's/rpc_address:.*$/rpc_address: 0.0.0.0/' /etc/cassandra/cassandra.yaml
