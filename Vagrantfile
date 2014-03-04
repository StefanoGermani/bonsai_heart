# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.box = 'CentOS'
  config.vm.box_url = 'https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box'

  config.vm.network :forwarded_port, guest: 3000, host: 3000

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', '2048']
  end

  config.vm.provision 'shell', inline: 'sudo yum update -y && curl -L https://www.opscode.com/chef/install.sh | bash'

  config.vm.provision 'chef_solo' do |chef|

    chef.add_recipe 'apt'
    chef.add_recipe 'nodejs'
    chef.add_recipe 'ruby_build'
    chef.add_recipe 'rbenv::user'
    chef.add_recipe 'rbenv::vagrant'
    chef.add_recipe 'vim'

    chef.json = {
        rbenv: {
            user_installs: [{
                                user: 'vagrant',
                                rubies: ['2.0.0-p353'],
                                global: '2.0.0-p353',
                                gems: {
                                    '2.0.0-p353' => [
                                        {name: 'bundler'}
                                    ]
                                }
                            }]
        }
    }
  end

end
