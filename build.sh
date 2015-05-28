#!/bin/sh

OpenCV_URL="https://github.com/Itseez/opencv/archive/3.0.0-rc1.tar.gz"

cd `dirname "$0"`
wget -q -O - $OpenCV_URL | tar zxvf -
cd ./opencv-3.0.0-rc1/
cmake -DCMAKE_INSTALL_PREFIX=../opencv-install .
make
make install
cd ..
cmake .
make
