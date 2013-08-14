# ref: http://indranilsinharoy.com/2012/11/01/installing-opencv-on-linux/
sudo apt-get update

sudo apt-get install -y build-essential
sudo apt-get install -y cmake
sudo apt-get install -y pkg-config

sudo apt-get install -y libgtk2.0-dev python-dev python-numpy

sudo apt-get install -y libpng12-0
sudo apt-get install -y libpng12-dev
sudo apt-get install -y libpng++-dev
sudo apt-get install -y libpng3
sudo apt-get install -y libpnglite-dev
sudo apt-get install -y libpngwriter0-dev
sudo apt-get install -y libpngwriter0c2
sudo apt-get install -y zlib1g-dbg
sudo apt-get install -y zlib1g
sudo apt-get install -y zlib1g-dev
sudo apt-get install -y pngtools
sudo apt-get install -y libjasper-dev
sudo apt-get install -y libjasper-runtime
sudo apt-get install -y libjasper1
sudo apt-get install -y libjpeg8
sudo apt-get install -y libjpeg8-dbg
sudo apt-get install -y libjpeg62
sudo apt-get install -y libjpeg62-dev
sudo apt-get install -y libjpeg-progs
sudo apt-get install -y libtiff4-dev
sudo apt-get install -y libtiff4
sudo apt-get install -y libtiffxx0c2
sudo apt-get install -y libtiff-tools
sudo apt-get install -y ffmpeg
sudo apt-get install -y libavcodec-dev
sudo apt-get install -y libavcodec52
sudo apt-get install -y libavformat52
sudo apt-get install -y libavformat-dev
sudo apt-get install -y libswscale0
sudo apt-get install -y libswscale-dev
sudo apt-get install -y openexr
sudo apt-get install -y libopenexr6
sudo apt-get install -y libopenexr-dev

sudo apt-get install -y libgstreamer0.10-0-dbg
sudo apt-get install -y libgstreamer0.10-0
sudo apt-get install -y libgstreamer0.10-dev
sudo apt-get install -y libgstreamer-plugins-base0.10-dev
sudo apt-get install -y libxine1-ffmpeg
sudo apt-get install -y libxine-dev
sudo apt-get install -y libxine1-bin
sudo apt-get install -y libunicap2
sudo apt-get install -y libunicap2-dev
sudo apt-get install -y libucil2
sudo apt-get install -y libucil2-dev
sudo apt-get install -y libdc1394-22-dev
sudo apt-get install -y libdc1394-22
sudo apt-get install -y libdc1394-utils
sudo apt-get install -y libv4l-0
sudo apt-get install -y libv4l-dev

#download opencv
ORIGIN_DIR=`pwd`
TEMP_DIR_NAME=asdfghjkl123
cd $HOME
mkdir TEMP_DIR_NAME
cd TEMP_DIR_NAME
OPENCV_TARBALL='http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/2.4.6.1/opencv-2.4.6.1.tar.gz?r=http%3A%2F%2Fopencv.org%2Fdownloads.html&ts=1376453228&use_mirror=jaist'
OPENCV_PACKAGE='opencv-2.4.6.1.tar.gz'
wget $OPENCV_TARBALL -O $OPENCV_PACKAGE
tar -xzf $OPENCV_PACKAGE

cd opencv-2.4.6.1
cmake .
make -j 4
sudo make install

#remove TEMP_DIR_NAME
