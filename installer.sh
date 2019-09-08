#!/bin/sh

# Install required apps and libraries
sudo apt-get -y install git build-essential automake libcurl4-openssl-dev

# Roswell download and Install
git clone -b release https://github.com/roswell/roswell.git
cd roswell
sh bootstrap
./configure --prefix=$HOME/.local
make
make install
echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.bashrc
PATH=$HOME/.local/bin:$PATH
ros setup

# Install clispi
ros install fireflower0/clispi
echo 'export PATH=$HOME/.roswell/bin:$PATH' >> ~/.bashrc
PATH=$HOME/.roswell/bin:$PATH
