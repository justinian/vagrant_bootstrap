# vi: set ft=ruby :

PROJECT_NAME = "project"
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "trusty64"
	config.vm.hostname = PROJECT_NAME
	config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
	# config.vm.box_check_update = false

	config.vm.define PROJECT_NAME do |project|
	end

	config.vm.provider :virtualbox do |vb|
		vb.name = PROJECT_NAME
		vb.memory = 2048
		vb.cpus = 2
		#vb.gui = true
	end

	# config.vm.network "forwarded_port", guest: 80, host: 8080
	# config.vm.network "private_network", ip: "192.168.33.10"
	config.vm.network "public_network"
	config.ssh.forward_agent = true

	config.vm.synced_folder ".", "/vagrant" #, mount_options: ["fmode=0664", "dmode=0775"]

	config.vm.provision "shell", path: "provision/vagrant_provision.sh"
end
