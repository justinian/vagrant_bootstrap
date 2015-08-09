# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"
VAGRANT_COMMAND = ARGV[0]

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "debian/jessie64"
	config.vm.hostname = "justin-dev"

	config.vm.provider :virtualbox do |vb|
		vb.name = "development"
		vb.memory = 2048
		vb.cpus = 2
		#vb.gui = true
	end

	config.vm.define "development" do |dev|
		# dev.vm.network "forwarded_port", guest: 80, host: 8080
		# dev.vm.network "private_network", ip: "192.168.33.10"
		dev.vm.network "public_network"
		dev.ssh.forward_agent = true

		#dev.vm.synced_folder ".", "/vagrant" #, mount_options: ["fmode=0664", "dmode=0775"]

		dev.vm.provision "ansible" do |ansible|
			ansible.playbook = "provision/development.yml"
		end
	end

end
