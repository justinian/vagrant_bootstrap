# vi: set ft=ruby :
require 'yaml'

settings = YAML.load_file "project.yml"

project_name = settings['name']

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "jessie64"
	config.vm.hostname = project_name
	config.vm.box_url = "https://github.com/holms/vagrant-jessie-box/releases/download/Jessie-v0.1/Debian-jessie-amd64-netboot.box"
	config.vm.box_check_update = false

	config.vm.provider :virtualbox do |vb|
		vb.name = project_name
		vb.memory = 2048
		vb.cpus = 2
		#vb.gui = true
	end

	config.vm.define project_name do |project|
		# project.vm.network "forwarded_port", guest: 80, host: 8080
		# project.vm.network "private_network", ip: "192.168.33.10"
		project.vm.network "public_network"
		project.ssh.forward_agent = true

		#project.vm.synced_folder ".", "/vagrant" #, mount_options: ["fmode=0664", "dmode=0775"]

		project.vm.provision "shell",
			inline: "apt-get install -y -q software-properties-common"

		unless settings['repositories'].nil?
			settings['repositories'].each do |repo|
				project.vm.provision "shell",
					inline: "apt-add-repository #{repo}"
			end
		end

		project.vm.provision "shell",
			inline: "apt-get -qq update"

		unless settings['packages'].nil?
			settings['packages'].each do |pkg|
				project.vm.provision "shell",
					inline: "apt-get install -y -q #{pkg}"
			end
		end

		project.vm.provision "shell",
			inline: "apt-get autoremove -y"

		project.vm.provision "shell", privileged: false,
			inline: "echo 'git clone #{settings['giturl']} /home/vagrant/#{project_name}' >> /home/vagrant/.bashrc"

		project.vm.provision "shell", privileged: false,
			path: "provision.sh"
	end

end
