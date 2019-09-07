sudo apt-get -y install git build-essential automake libcurl4-openssl-dev
git clone -b release https://github.com/roswell/roswell.git
cd roswell
sh bootstrap
./configure --prefix=$HOME/.local
make
make install
echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
ros setup
ros install qlot
ros install slime
ros install fireflower0/clispi
echo 'export PATH=$HOME/.roswell/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
