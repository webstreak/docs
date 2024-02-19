## Updating Rubies on ubuntu servers

Some helpful general reading and advice:
[FastRuby A Step-by-Step Guide to Upgrading Your Ruby Version](https://www.fastruby.io/blog/step-by-step-ruby-upgrade.html)
[GitLab Ruby Upgrade Guidelines](https://docs.gitlab.com/ee/development/ruby_upgrade.html)
[RVM installing rubies](https://rvm.io/rubies/installing)

### Installing Ruby on an ubuntu server with RVM, the ruby version manager

1. [Upgrading RVM](https://rvm.io/rvm/upgrading) SSH into the instance as a user in the rvm group (ubuntu/deployer), and update RVM itself by running ```rvm get stable```. This will update the available rubies that RVM is aware of.
2. [Known Rubies](https://rvm.io/rubies/installing) Confirm that the version of Ruby you need is known to RVM by running ```rvm list known```, if not see step 1.
3. [Package upgrades/updates](https://rvm.io/rvm/autolibs) I suggest setting the ```autolibs``` functionality of RVM to ```read-fail``` by running ```rvm autolibs read-fail```. This will disable RVM trying to update or install packages on the ubuntu server that the new ruby version might need. With this flag enabled you will be able to see what packages need updating/installing BEFORE ruby is installed and you can then prepare the server appropriately before proceeding.
4. [Install Ruby](https://rvm.io/rubies/installing) After satisfying the package requirements for your desired ruby version, you can now install ruby itself by running ```rvm install $VERSION``` where $VERSION is your desired ruby version. 
5. [Setting default Ruby](https://rvm.io/rubies/default) You can change the current ruby version (for your session only) by running ```rvm use $VERSION```. However, you can set the default ruby, that being the one that will be selected by default in your application and packaging, by running ```rvm --default use $VERSION```
6. Dont forget to install the bundler gem for the new ruby. ```gem install bundler``` for latest OR ```gem install bundler:$BUNDLER_VERSION``` for a specific version of bundler.

### Updating Ruby in a Ruby on Rails application

You must update your Gemset for compatibility with the target Ruby version before proceeding.

1. For RVM to know what version of Ruby to select for the application, you should set the version in the ```.ruby-version``` dotfile in the root of the application codebase. Please note, RVM will use the default-selected version of Ruby when deploying with capistrano.
2. For RVM to choose the version you are updating to, either set the new ruby version default on the server, or use the following configuration option in the config/deploy/ENVIRONMENT.rb file ```set :rvm_ruby_version, '$RUBY_VERSION'``` when deploying.
3. IMPORTANT: There is a known issue when using unicorn as your application server. When updating ruby versions, unicorn may continue to run stale code/previous versions until it has been properly restarted. You must manually kill ```kill -QUIT PID``` the master unicorn instance and restart daemonized ```bundle exec unicorn -c ./config/unicorn_production -E production -D``` OR kill the master instance and then deploy the application again (thus restarting the application server as part of the deploy process)