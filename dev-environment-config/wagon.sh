#!/bin/sh

echo "------IMAGEMAGICK-------"
#install imagemagik
sudo apt-get install imagemagick -y
sudo ln -s /usr/bin/identify /usr/local/bin/identify

echo "------INSTALL CURL IMAGEMAGICK-------"
#install curl
sudo apt-get install curl -y

echo "------INSTALL RVM-------"
#RVM
\curl -L https://get.rvm.io | 
  bash -s stable --ruby --autolibs=enable --auto-dotfiles

source /home/vagrant/.rvm/scripts/rvm

echo "------INSTALL BUNDLER-------"
#bundler
gem install bundler

echo "------INSTALL RAKE-------"
#rake
gem install rake

echo "------INSTALL WAGON-------"
#wagon

sudo gem install locomotivecms_wagon
wagon version

echo "Wagon Installed. All Done."

source /home/vagrant/.rvm/scripts/rvm

