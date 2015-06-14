#!/bin/sh

# Install all my SSH keys
mkdir -p /home/vagrant/.ssh
cat /vagrant/authorized_keys >> /home/vagrant/.ssh/authorized_keys

# Install my Vim runtime
VIM_GIT="https://github.com/justinian/vim_runtime.git"
git clone $VIM_GIT /home/vagrant/.vim

# Install my dotfiles
DOTS_GIT="https://justinian@bitbucket.org/justinian/dotfiles.git"
git clone $DOTS_GIT /home/vagrant/.dotfiles
echo "/home/vagrant/.dotfiles/.install" >> /home/vagrant/.bashrc
echo "exec bash -l" >> /home/vagrant/.bashrc

HOST_BASHRC="/home/vagrant/.dotfiles/bashrc.d/hosts/$(hostname)"
echo "HOST_COLOR='01;31m'" >> $HOST_BASHRC
echo "SKIP_ALUCARD=1" >> $HOST_BASHRC
