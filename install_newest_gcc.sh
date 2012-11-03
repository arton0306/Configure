# install path
export GCC_PATH=/usr/bin/
export GCC_FOLDER_NAME=gcc-4.7.2

# install some dependencies
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install g++
sudo apt-get install gawk
sudo apt-get install m4
sudo apt-get install gcc-multilib

# install newest gmp (http://gmplib.org/)
cd ~/Downloads
wget ftp://ftp.gmplib.org/pub/gmp-5.0.5/gmp-5.0.5.tar.bz2
tar -jxf gmp-5.0.5.tar.bz2
cd gmp-5.0.5
mkdir build
cd build
../configure --prefix=$GCC_PATH$GCC_FOLDER_NAME --build=x86_64-linux-gnu
make
sudo make install

# install newest mpfr (http://www.mpfr.org/)
cd ~/Downloads
wget http://www.mpfr.org/mpfr-current/mpfr-3.1.1.tar.bz2
tar -jxf mpfr-3.1.1.tar.bz2
cd mpfr-3.1.1
mkdir build
cd build
../configure --build=x86_64-linux-gnu --prefix=$GCC_PATH$GCC_FOLDER_NAME --with-gmp=$GCC_PATH$GCC_FOLDER_NAME
make
sudo make install

# install newest mpc (http://www.multiprecision.org/)
cd ~/Downloads
wget http://www.multiprecision.org/mpc/download/mpc-1.0.1.tar.gz
tar -zxf mpc-1.0.1.tar.gz
cd mpc-1.0.1
mkdir build
cd build
../configure --build=x86_64-linux-gnu --prefix=$GCC_PATH$GCC_FOLDER_NAME --with-gmp=$GCC_PATH$GCC_FOLDER_NAME --with-mpfr=$GCC_PATH$GCC_FOLDER_NAME
make
sudo make install

# install gcc
cd ~/Downloads
wget --user-agent=Safari "ftp://208.118.235.20/gnu/gcc/gcc-4.7.2/gcc-4.7.2.tar.bz2"
tar -jxf gcc-4.7.2.tar.bz2
cd gcc-4.7.2
mkdir build
cd build
export LD_LIBRARY_PATH=$GCC_PATH$GCC_FOLDER_NAME/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/
export C_INCLUDE_PATH=/usr/include/x86_64-linux-gnu
export CPLUS_INCLUDE_PATH=/usr/include/x86_64-linux-gnu
../configure --build=x86_64-linux-gnu --prefix=$GCC_PATH$GCC_FOLDER_NAME --with-gmp=$GCC_PATH$GCC_FOLDER_NAME --with-mpfr=$GCC_PATH$GCC_FOLDER_NAME --with-mpc=$GCC_PATH$GCC_FOLDER_NAME --enable-checking=release --enable-languages=c,c++
sudo ln -s /usr/lib/x86_64-linux-gnu $GCC_PATHlib64
sudo make install

# set gcc path
export PATH=$GCC_PATH$GCC_FOLDER_NAME/bin:$PATH
export LD_LIBRARY_PATH=$GCC_PATH$GCC_FOLDER_NAME/lib:$GCC_PATH$GCC_FOLDER_NAME/lib64:$LD_LIBRARY_PATH
