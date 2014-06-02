#!/bin/sh

# Add sources from vagrant_sources.txt, if there are any
xargs -r -a /vagrant/provision/vagrant_sources.txt -- add-apt-repository -y

# Get all latest package info from sources
echo -n "Updating apt package lists..."
if apt-get -qq update; then
	echo " Done."
else
	echo " ERROR!"
fi

# Install packages from vagrant_packages.txt and clean up leftovers
xargs -r -a /vagrant/provision/vagrant_packages.txt -- apt-get install -y -q
apt-get autoremove -y

# Install all my SSH keys
mkdir -p /home/vagrant/.ssh
cat /vagrant/provision/authorized_keys >> /home/vagrant/.ssh/authorized_keys

# Install my dotfiles
DOTS_GIT="https://justinian@bitbucket.org/justinian/dotfiles.git"
sudo -u vagrant git clone $DOTS_GIT /home/vagrant/.dotfiles
sudo -u vagrant /home/vagrant/.dotfiles/.install
