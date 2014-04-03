#!/bin/sh

cd /vagrant/engine
echo "------BUNDLE INSTALL-----"
bundle install
echo "-----LOCOMOTIVE INSTALL-----"
bundle exec rails g locomotive:install


echo "DONE."
