#
# Cookbook Name:: bonsai_heart_installer
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute 'go-to-app-folder' do
  command 'cd /vagrant'
end

execute 'install-ruby-gems' do
  command 'bundle'
end

execute 'create-databases' do
  command 'rake db:create'
end

execute 'migrate-dev-database' do
  command 'rake db:migrate RAILS_ENV=development'
end

execute 'migrate-test-database' do
  command 'rake db:migrate RAILS_ENV=test'
end

