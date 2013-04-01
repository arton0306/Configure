#!/bin/bash

cd $HOME

# used pathes
WORK_DIR=`pwd`
DOWNLOAD_DIR="$WORK_DIR/downloads"
SOURCE_DIR="$WORK_DIR/sources"
BUILD_DIR="$WORK_DIR/build"

# package links
BOOST_TARBALL='http://sourceforge.net/projects/boost/files/boost/1.52.0/boost_1_52_0.tar.bz2/download?utm_expid=65835818-0&utm_referrer=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fboost%2Ffiles%2Fboost%2F1.52.0%2F'

# packages
BOOST_PACKAGE='boost_1_53_0.tar.bz2'

# package names
BOOST_NAME='boost_1_53_0'

# install prefixes
BOOST_PREFIX='/usr/local'

# core number for quick build
CORE_NUM='4'

echo $WORK_DIR
echo $DOWNLOAD_DIR
echo $SOURCE_DIR
echo $BUILD_DIR
echo $GCC_TARBALL

echo "downloading boost-1.53.0"
cd $DOWNLOAD_DIR
cd $WORK_DIR

echo "boost-1.53.0"
cd $SOURCE_DIR
tar -xvf $DOWNLOAD_DIR/$BOOST_PACKAGE
cd $WORK_DIR

echo "start building boost-1.53.0"
sudo apt-get install libbz2-dev zlib1g-dev
cd $SOURCE_DIR/$BOOST_NAME
./bootstrap.sh && ./b2 --prefix=$BOOST_PREFIX --without-python stage
sudo ./b2 --prefix=$BOOST_PREFIX --without-python install
cd $WORK_DIR

echo "update ldconfig after boost-1.53.0"
sudo ldconfig
