# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.box = 'Precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 1234, host: 1234

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', '2048']
  end

  config.vm.provision 'shell', inline: 'sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get install curl -y && curl -L https://www.opscode.com/chef/install.sh | sudo bash'

  config.vm.provision 'chef_solo' do |chef|

    chef.cookbooks_path = %w(cookbooks my_cookbooks)

    chef.add_recipe 'apt'
    chef.add_recipe 'nodejs'
    chef.add_recipe 'ruby_build'
    chef.add_recipe 'rbenv::user'
    chef.add_recipe 'rbenv::vagrant'
    chef.add_recipe 'vim'
    chef.add_recipe 'postgresql::server'
    chef.add_recipe 'postgresql::libpq'
    chef.add_recipe 'bonsai_heart_installer'
    chef.add_recipe 'phantomjs::default'

    chef.json = {
        rbenv: {
            user_installs: [{
                                user: 'vagrant',
                                rubies: ['2.1.1'],
                                global: '2.1.1',
                                gems: {
                                    '2.1.1' => [
                                        {name: 'bundler'}
                                    ]
                                }
                            }]
        },

        postgresql: {
            users: [
                {
                    username: 'bonsaiheart',
                    password: 'password',
                    superuser: true,
                    createdb: true,
                    login: true
                }
            ],
            pg_hba: [
              { type: 'local', db: 'all', user: 'postgres',   addr: '',             method: 'trust'},
              { type: 'local', db: 'all', user: 'all',        addr: '',             method: 'md5'},
              { type: 'host',  db: 'all', user: 'all',        addr: '127.0.0.1/32', method: 'md5'},
              { type: 'host',  db: 'all', user: 'all',        addr: '::1/128',      method: 'md5'},
              { type: 'host',  db: 'all', user: 'postgres',   addr: '127.0.0.1/32', method: 'md5'}
          ]
        }
    }
  end

end
