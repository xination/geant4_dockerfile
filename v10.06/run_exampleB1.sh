
touch "$HOME/.Xauthority"

G4_VERSION="10.06.p01"

docker run --rm -it \
--volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
--net=host \
--env="DISPLAY" \
geant_qt:v${G4_VERSION} \
bash -c 'cd /opt/geant4/src/geant4.${G4_VERSION}/examples/basic/B1/  && \
         mkdir ./build && \
         cd build && cmake .. && make && ./exampleB1 ;\
         bash' 

 


