Locomotive Engine & Wagon Configuration
=================

--------------
##Set up Vagrant

1) Install Virtual Box <https://www.virtualbox.org/>

2) Install Vagrant <http://www.vagrantup.com/>

3) Copy the `VagrantFile` from this repo to your desired working directory.

4) In terminal
- `cd PATH\TO\VagrantFile`
- `vagrant up`

5) Wait.

6) `vagrant ssh`

7) Congrats. You're in a fresh VM.


##Install Wagon
(*Reference:* <http://doc.locomotivecms.com/get-started/install-wagon#linux>)

1) Install imagemagick
- `cd /usr/local/bin`
- `apt-get install imagemagick`
- `ln -s /usr/bin/identify /usr/local/bin/identify`

2) Install RVM &  the correct version of Ruby 1.9.3 or higher

- `\curl -L https://get.rvm.io | bash -s --ruby --autolibs=enable --auto-dotfiles`
- `source /home/vagrant/.rvm/scripts/rvm`

3) Install bundler and rake

- Bundler: `gem install bundler`
- Rake: `gem install rake`

4) Install Wagon

`gem install locomotivecms_wagon`

## Install Engine Locally
*This step is optional and not won't be required for MOST devs* 

(*Reference:* <http://doc.locomotivecms.com/get-started/install-engine-locally#linux>)

1) Install MongoDB

- `sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10`
- `echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list`
- `sudo apt-get update`
- `sudo apt-get install mongodb-10gen`

*To get mongo running, you may have to create & specify the DB path:*
- `mkdir <path>/data/db`
- `sudo chown -R /data/db`
- `mongod -dbpath ~/<path>/data/db`

2) Install Ruby on Rails 3.2.16
- `gem install rails --version=3.2.16 --no-ri --no-rdoc`

3) Initialize Rails App
- `rails new acme_cms --skip-active-record --skip-test-unit --skip-javascript --skip-bundle --no-ri --no-rdoc`

3a) cd into your new app and edit the gemfile:

    source 'https://rubygems.org'

    gem 'rails', '3.2.17'

    gem 'locomotive_cms', '~> 2.4.1', :require => 'locomotive/engine'

    group :assets do
      gem 'compass-rails',  '~> 1.1.3'
      gem 'sass-rails',   '~> 3.2.3'
      gem 'coffee-rails', '~> 3.2.1'
      gem 'uglifier', '>= 1.0.3'
      gem 'therubyracer', :platforms => :ruby
    end

    gem 'unicorn'


3b) Run `bundle install` to install all of the necessary gems
- You may get an error around Nokogiri; if so run:
- `apt-get install libxslt-dev libxml2-dev` and rerun:
- `sodo gem install nokogiri`
- `bundle install`

4) Setup Locomotive Engine
- `bundle exec rails g locomotive:install`

5) In a different shell, spin up a mongo instance
- `mongod`
- to stop: `sudo service mongodb stop`

6) Start the unicorn server
- `bundle exec unicorn_rails`

7) Login and retreive the API key

-Login/Signup> Settings > My Account > Credentials

8) Add this API Key to config.deploy.rb so that it looks something like this:

    development:
      host: localhost:8080
      api_key: 7130e7e6ddbecbaf330a349385cce45be6961220


## Create and Setup a Site
1) Initialize a wagon
- `wagon init site_name_here -t bootstrap3`
- `cd site_name_here`
- `bundle install`

2a) Update deploy.yml

    development:
      host: dev.example.com
      email: john@doe.net
      password: apassword
      # api_key: <your api key here>

3) Start the wagon's webserver locally
- `bundle exec wagon serve`
-  This can be viewed on localhost:3333

4) Push and Pull to an engine
- `bundle exec wagon push <environment>`
- `bundle exec wagon pull <environment>`
- Engine can be viewed at `localhost:8080`

