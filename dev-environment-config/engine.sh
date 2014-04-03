#!/bin/sh

echo "-----INSTALLING MONGODB--------"

#mongodb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install mongodb-10gen
sudo service mongodb stop

echo "-----CHOWNING THINGS--------"

#setup db folders
sudo mkdir /data
sudo mkdir /data/db
sudo chown -R vagrant /data

echo "-----INSTALLING NOKOGIRI--------"
#nokogiri
sudo apt-get install libxslt-dev libxml2-dev
sudo gem install nokogiri -v '1.5.11'

echo "-----INSTALLING RAILS--------"
#rails 3
sudo gem install rails --version=3.2.16 --no-ri --no-rdoc

echo "-----MAKING ENGINE--------"
#make new dev engine
cd /vagrant
rails new engine --skip-active-record --skip-test-unit --skip-javascript --skip-bundle --no-ri --no-rdoc

echo "FINISHED! -- Modify gem file and run postinstall.sh"
