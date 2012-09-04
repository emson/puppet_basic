#!/bin/bash

host="${1:-ubuntu@ec2-54-247-36-131.eu-west-1.compute.amazonaws.com}"
echo "....bootstrapping host: $host"

ssh-keygen -R "${host#*@}" 2> /dev/null

scp -i ~/.ssh/rutucore.pem -r puppet $host:/home/ubuntu/
ssh -i ~/.ssh/rutucore.pem "$host" '
sudo apt-get update -y
sudo apt-get install -y curl git-core libcurl4-gnutls-dev libreadline-dev libssl-dev libyaml-dev zlib1g-dev && \
sudo apt-get install -y ruby1.9.3
sudo rm -rf /etc/puppet
sudo cp -r ~/puppet /etc/ && rm -rf ~/puppet
sudo puppet apply /etc/puppet/manifests/site.pp
'

