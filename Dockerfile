FROM ubuntu:bionic 
MAINTAINER xination <xination@gmail.com>

ENV G4_VERSION 10.05


RUN apt-get update -y && \
    apt-get install -y cmake curl g++ libexpat1-dev vim cmake-curses-gui freeglut3 freeglut3-dev mesa-utils python libx11-dev libxmu-dev expat && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /opt/geant4/src && \
    mkdir -p /opt/geant4/build && \
    mkdir -p /opt/geant4/install && \
    mkdir -p /opt/geant4/data && \
    curl -o /geant4.tar.gz http://geant4-data.web.cern.ch/geant4-data/releases/source/geant4.${G4_VERSION}.tar.gz && \
    tar xf /geant4.tar.gz -C /opt/geant4/src && \
    cd /opt/geant4/build && \
    cmake -DCMAKE_INSTALL_PREFIX=/opt/geant4/install \
          -DGEANT4_USE_OPENGL_X11=ON \
          -DGEANT4_INSTALL_DATA=OFF \
          -DGEANT4_INSTALL_DATADIR=/opt/geant4/data \
          -DGEANT4_BUILD_MULTITHREADED=OFF \
          -DGEANT4_INSTALL_EXAMPLES=ON \
          ../src/geant4.${G4_VERSION} && \
    make -j`nproc` && \
    make install && \
    rm /geant4.tar.gz 

 
COPY entry-point.sh /entry-point.sh
ENTRYPOINT ["/entry-point.sh"]
CMD ["/bin/bash"]
