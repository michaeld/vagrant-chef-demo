package 'ntp'

template '/etc/ntp.conf' do
  source    'ntp.conf.erb'
  mode 0755
  notifies  :restart, 'service[ntpd]'
end

service 'ntpd' do
  action [:enable, :start]
end