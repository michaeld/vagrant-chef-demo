Using Chef with Vagrant for provisioning virtual machines
=========================================================

Workstation Setup
-----------------

Install [Virtualbox 4.2+](https://www.virtualbox.org/wiki/Downloads) and [Vagrant 1.2+](http://downloads.vagrantup.com/) for your operating system.

Execute the Opscode Chef omnibus installer

`$ curl -L https://www.opscode.com/chef/install.sh | sudo bash`

Finally, to reduce typing in the future, add Omnibus Ruby to your path:

`$ echo 'export PATH="/opt/chef/embedded/bin:$PATH"' >> ~/.bash_profile && source ~/.bash_profile`

* Either 'git clone' or 'download zip and expand' this repository onto your workstation
* Next...

```
$ cd vagrant-chef-demo
$ vagrant up
```

Your First Cookbook
===================

Write the Recipe
----------------

In the default recipe cookbooks/ntp/recipes/default.rb, add the following:

Install the NTP package. The package provider is built into Chef - it will check to see the running operating system and use the appropriate method (yum, apt, etc):

```ruby
package 'ntp'
```

Next we need to write out the NTP configuration template using Chef's Template provider:

```ruby
template '/etc/ntp.conf' do
  source    'ntp.conf.erb'
  notifies  :restart, 'service[ntp]'
end
```

Finally, alert Chef of the service and start it:

```ruby
service 'ntp' do
  action [:enable, :start]
end
```

Your final recipe should look like this:

```ruby
package 'ntp'

template '/etc/ntp.conf' do
  source    'ntp.conf.erb'
  notifies  :restart, 'service[ntp]'
end

service 'ntp' do
  action [:enable, :start]
end
```