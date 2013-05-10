# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.box = "centos-6.3"
  config.vm.box_url = "https://s3.amazonaws.com/itmat-public/centos-6.3-chef-10.14.2.box"
  config.vm.network :forwarded_port, guest: 8080, host: 8888  

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 1024]
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "./cookbooks"
    #chef.roles_path = "./roles"
    #chef.data_bags_path = "./data_bags"
    chef.add_recipe "apache2"
    chef.add_recipe "demo"
    #chef.log_level = :debug
  end

end
