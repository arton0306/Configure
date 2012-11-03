# install path
export GCC_PATH=/usr/bin/
export GCC_FOLDER_NAME=gcc-4.7.2

# install some dependencies
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install build-essential
sudo apt-get -y install g++
sudo apt-get -y install gawk
sudo apt-get -y install m4
sudo apt-get -y install gcc-multilib

sudo apt-get -y install libgmp3c2 # install newest gmp (http://gmplib.org/)
sudo apt-get -y install libmpfr4 # install newest mpfr (http://www.mpfr.org/)
sudo apt-get -y install libmpc-dev # install newest mpc (http://www.multiprecision.org/)

# install gcc
cd ~/Downloads
wget --user-agent=Safari "ftp://208.118.235.20/gnu/gcc/gcc-4.7.2/gcc-4.7.2.tar.bz2"
tar -jxf gcc-4.7.2.tar.bz2
cd gcc-4.7.2
mkdir build
cd build
export lib64name=lib64
### export LD_LIBRARY_PATH=$GCC_PATH$GCC_FOLDER_NAME/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/
export C_INCLUDE_PATH=/usr/include/x86_64-linux-gnu
export CPLUS_INCLUDE_PATH=/usr/include/x86_64-linux-gnu
../configure --build=x86_64-linux-gnu --prefix=$GCC_PATH$GCC_FOLDER_NAME --enable-checking=release --enable-languages=c,c++
make
sudo ln -s /usr/lib/x86_64-linux-gnu $GCC_PATH$lib64name
sudo make install

# set gcc path
export PATH=$GCC_PATH$GCC_FOLDER_NAME/bin:$PATH
export LD_LIBRARY_PATH=$GCC_PATH$GCC_FOLDER_NAME/lib:$GCC_PATH$GCC_FOLDER_NAME/lib64:$LD_LIBRARY_PATH
