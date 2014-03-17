#
# Cookbook Name:: bonsai_heart_installer
# Recipe:: default
#
# Copyright 2014, ThunderCode
#
# All rights reserved - Do Not Redistribute
#

Chef::Log.info 'Installing ruby gems...'

bash 'install-ruby-gems' do
  code  "su vagrant -l -c 'cd /vagrant && bash -i bundle'"
  action :run
end

bash 'copy-database-config' do
  code 'cp /vagrant/config/database.vagrant.yml /vagrant/config/database.yml -f'
  action :run
end

bash 'create-databases' do
  code  "su vagrant -l -c 'cd /vagrant && bash -i rake db:create'"
  action :run
end

bash 'migrate-dev-database' do
  code  "su vagrant -l -c 'cd /vagrant && bash -i rake db:migrate RAILS_ENV=development'"
  action :run
end

bash 'migrate-test-database' do
  code  "su vagrant -l -c 'cd /vagrant && bash -i rake db:migrate RAILS_ENV=test'"
  action :run
end

