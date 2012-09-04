# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.ssh.max_tries = 50
  config.ssh.timeout = 300
  config.vm.customize ["modifyvm", :id, "--name", "rutucore", "--memory", "512"]
  # config.vm.boot_mode = :gui
  config.vm.box = "ubuntu12-ruby193"
  config.vm.host_name = "rutucore"
  config.vm.forward_port 22, 2222, :auto => true
  config.vm.forward_port 80, 4567
  config.vm.network :hostonly, "33.33.13.50"
  config.vm.share_folder "puppet", "/etc/puppet", "./puppet"
end

