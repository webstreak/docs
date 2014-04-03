# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box      = 'precise64'
  config.vm.box_url  = 'http://files.vagrantup.com/precise64.box'
  config.vm.hostname = 'rails-dev-box'

  config.vm.provider 'vmware_fusion' do |v, override|
    override.vm.box     = 'precise64'
    override.vm.box_url = 'http://files.vagrantup.com/precise64_vmware.box'
  end

  #rails
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  
  #engine
  config.vm.network :forwarded_port, guest: 8080, host: 8080

  #wagon
  config.vm.network :forwarded_port, guest: 3333, host: 3333

end
