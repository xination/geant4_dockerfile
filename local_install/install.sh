#!/bin/bash

G4_VERSION="10.06.p01"
QT_VERSION="4.8.7"

sudo apt-get update -y && \
sudo apt-get install -y wget g++-5 gcc-5 cmake libexpat1-dev vim cmake-curses-gui freeglut3 freeglut3-dev mesa-utils python libx11-dev libxmu-dev expat && \
sudo apt-get install -y libfontconfig1-dev libfreetype6-dev libxcursor-dev libxext-dev libxfixes-dev libxft-dev libxi-dev libxrandr-dev libxrender-dev && \
echo "-----handle g++ compiler-----"  && \
sudo rm /usr/bin/gcc && \
suod rm /usr/bin/g++ && \
sudo ln -s /usr/bin/gcc-5 /usr/bin/gcc && \
sudo ln -s /usr/bin/g++-5 /usr/bin/g++ && \
echo "-----build QT 4.8.7 -----"  && \
cd $HOME && \
wget https://download.qt.io/archive/qt/4.8/{QT_VERSION}/qt-everywhere-opensource-src-${QT_VERSION}.tar.gz && \
tar xf qt-everywhere-opensource-src-${QT_VERSION}.tar.gz && \
sudo rm qt-everywhere-opensource-src-${QT_VERSION}.tar.gz && \
cd qt-everywhere-opensource-src-${QT_VERSION} && \
./configure -opensource <<< yes && \
make -j`nproc` && \
sudo make install && \
echo "-----build geant4-----" && \
cd / && \
sudo mkdir -p /opt/geant4/src && \
sudo mkdir -p /opt/geant4/build && \
sudo mkdir -p /opt/geant4/install && \
sudo mkdir -p /opt/geant4/data && \
sudo wget http://cern.ch/geant4-data/releases/geant4.${G4_VERSION}.tar.gz && \
sudo tar xf /geant4.${G4_VERSION}.tar.gz -C /opt/geant4/src && \
sudo rm /geant4.${G4_VERSION}.tar.gz && \
cd /opt/geant4/build && \
cmake -DCMAKE_INSTALL_PREFIX=/opt/geant4/install \
      -DGEANT4_USE_OPENGL_X11=ON \
      -DQT_QMAKE_EXECUTABLE=/usr/local/Trolltech/Qt-${QT_VERSION}/bin/qmake \
      -DGEANT4_USE_QT=ON \
      -DGEANT4_INSTALL_DATA=ON \
      -DGEANT4_INSTALL_DATADIR=/opt/geant4/data \
      -DGEANT4_BUILD_MULTITHREADED=OFF \
      -DGEANT4_INSTALL_EXAMPLES=ON \
      ../src/geant4.${G4_VERSION} && \
make -j`nproc` && \
sudo make install 

echo "export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/Trolltech/Qt-${QT_VERSION}/lib" >> $HOME/.bashrc
echo "/opt/geant4/install/bin/geant4.sh" >> $HOME/.bashrc
