#!/bin/bash

# if you encounter "ld connot find ctr1.o, uncomment these
# ref: http://stackoverflow.com/questions/6329887/compiling-problems-cannot-find-crt1-o
# sudo ln -s /usr/lib/x86_64-linux-gnu /usr/lib64

cd $HOME

# used pathes
WORK_DIR=`pwd`
DOWNLOAD_DIR="$WORK_DIR/downloads"
SOURCE_DIR="$WORK_DIR/sources"
BUILD_DIR="$WORK_DIR/build"

# package links
GCC_TARBALL='http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/gcc-4.7.2/gcc-4.7.2.tar.bz2'
LLVM_TARBALL='http://llvm.org/releases/3.2/llvm-3.2.src.tar.gz'
CLANG_TARBALL='http://llvm.org/releases/3.2/clang-3.2.src.tar.gz'
BOOST_TARBALL='http://sourceforge.net/projects/boost/files/boost/1.52.0/boost_1_52_0.tar.bz2/download?utm_expid=65835818-0&utm_referrer=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fboost%2Ffiles%2Fboost%2F1.52.0%2F'

# packages
GCC_PACKAGE='gcc-4.7.2.tar.bz2'
LLVM_PACKAGE='llvm-3.2.src.tar.gz'
CLANG_PACKAGE='clang-3.2.src.tar.gz'
BOOST_PACKAGE='boost_1_52_0.tar.bz2'

# package names
GCC_NAME='gcc-4.7.2'
LLVM_NAME='llvm-3.2.src'
CLANG_NAME='clang-3.2.src'
BOOST_NAME='boost_1_52_0'

# install prefixes
GCC_PREFIX='/usr/local'
LLVM_PREFIX='/usr/local'
BOOST_PREFIX='/usr/local'

# core number for quick build
CORE_NUM='4'

echo $WORK_DIR
echo $DOWNLOAD_DIR
echo $SOURCE_DIR
echo $BUILD_DIR
echo $GCC_TARBALL

echo "preparing utilities"
sudo apt-get install tar wget -y

echo "downloading sources: gcc-4.7.2, llvm-3.2, clang-3.2, boost-1.52.0"
cd $DOWNLOAD_DIR
wget $GCC_TARBALL -O $GCC_PACKAGE
wget $LLVM_TARBALL -O $LLVM_PACKAGE
wget $CLANG_TARBALL -O $CLANG_PACKAGE
wget $BOOST_TARBALL -O $BOOST_PACKAGE
cd $WORK_DIR

echo "preparing sources: gcc-4.7.2, llvm-3.2, clang-3.2, boost-1.52.0"
cd $SOURCE_DIR
tar -xf $DOWNLOAD_DIR/$GCC_PACKAGE
tar -xf $DOWNLOAD_DIR/$LLVM_PACKAGE
tar -xf $DOWNLOAD_DIR/$CLANG_PACKAGE
tar -xf $DOWNLOAD_DIR/$BOOST_PACKAGE
mv -v $CLANG_NAME $SOURCE_DIR/$LLVM_NAME/tools/clang
cd $WORK_DIR

echo "preparing dependency of gcc-4.7.2"
sudo apt-get install libgmp3-dev libmpc-dev libmpfr-dev m4 g++-multilib gcc-multilib autoconf autogen binutils-dev dejagnu expect flex gperf guile-1.8 subversion texinfo -y

echo "start building gcc-4.7.2"
cd $SOURCE_DIR/$GCC_NAME
./configure --enable-languages=c,c++ && make -j $CORE_NUM && sudo make install
cd $WORK_DIR

echo "update ldconfig after libstdc++ from gcc-4.7.2"
sudo sh -c "echo '$GCC_PREFIX/lib64' > /etc/ld.so.conf.d/libc64.conf" && sudo ldconfig

echo "start building llvm-3.2, clang-3.2"
cd $SOURCE_DIR/$LLVM_NAME
./configure --enable-assertions --disable-optimized --enable-debug-runtime --prefix=/usr/lib/llvm-3.2
make REQUIRES_RTTI=1 -j $CORE_NUM && sudo make install
cd $WORK_DIR

echo "update ldconfig after llvm-3.2, clang-3.2"
sudo ldconfig

echo "start building boost-1.52.0"
sudo apt-get install libbz2-dev zlib1g-dev
cd $SOURCE_DIR/$BOOST_NAME
./bootstrap.sh && ./b2 --prefix=$BOOST_PREFIX --without-python stage
sudo ./b2 --prefix=BOOST_PREFIX --without-python install
cd $WORK_DIR

echo "update ldconfig after boost-1.52.0"
sudo ldconfig

### And execute the steps below...
# install msgpack (https://github.com/msgpack/website/blob/master/releases/cpp/msgpack-0.5.7.tar.gz)
sudo wget https://github.com/msgpack/website/blob/master/releases/cpp/msgpack-0.5.7.tar.gz -O msgpack-0.5.7.tar.gz
# install ttb (http://threadingbuildingblocks.org/uploads/77/189/4.1%20update%201/tbb41_20121003oss_lin.tgz)
# install cogapp (http://pypi.python.org/packages/source/c/cogapp/cogapp-2.3.tar.gz#md5=d801042bba801e8837f6d9781e7a6454)
#
# Download repo from here: http://code.google.com/p/git-repo/downloads/list
# chmod +x repo (you can put it under /usr/sbin)
# repo init -u git@github.com:zillians/platform_manifest_supercell.git
# repo sync
# repo forall -c git checkout -b master --track origin/master
# repo forall -c git checkout -b develop --track origin/develop
#
# create a folder for buildout at where you like ( but out of source ), and enter this folder
# cmake -DENABLE_FEATURE_CUDA=OFF -DCMAKE_BUILD_TYPE=Debug source-path( the folder named platform )
# modify llvm-config position to correct position ( /usr/lib/llvm-3.1/llvm-config ) with ccmake
# install rstm ( https://github.com/zillians/rstm )
# ccmake .
#
# make zillians-language-compiler-collection
# test some cases
