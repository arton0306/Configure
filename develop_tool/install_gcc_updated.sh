# install some dependencies
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install build-essential
sudo apt-get -y install g++
sudo apt-get -y install gawk
sudo apt-get -y install m4
sudo apt-get -y install gcc-multilib
sudo apt-get -y install libgmp3-dev # install gmp (http://gmplib.org/)
sudo apt-get -y install libmpfr-dev # install mpfr(http://www.mpfr.org/)
sudo apt-get -y install libmpc-dev  # install mpc (http://www.multiprecision.org/)

# install gcc
cd ~/downloads
wget --user-agent=Safari "ftp://208.118.235.20/gnu/gcc/gcc-4.8.0/gcc-4.8.0.tar.bz2"
tar -jxf gcc-4.8.0.tar.bz2
cd gcc-4.8.0
mkdir build && cd build
../configure --enable-languages=c,c++
make && sudo make install
