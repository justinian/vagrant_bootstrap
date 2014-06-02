#!/bin/sh

xargs -r -a /vagrant/provision/vagrant_sources.txt -- add-apt-repository -y

echo -n "Updating apt package lists..."
if apt-get -qq update; then
	echo " Done."
else
	echo " ERROR!"
fi

xargs -r -a /vagrant/provision/vagrant_packages.txt -- apt-get install -y -q
apt-get autoremove -y
