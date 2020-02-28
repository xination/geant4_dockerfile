# geant4_dockerfile
geant4.10.06 based on Ubuntu 18.04 <br>
with geant4 data, and openGL.

**0 Get the Docker image from Dockerhub** <br>
$ docker pull xination/geant4.10.06

**1 run** <br>
There is a run_exampleB1.sh script for you to test it.  <br>
<br>
docker run --rm -it \\<br>
--volume="$HOME/.Xauthority:/root/.Xauthority:rw" \ <br>
--net=host \ <br>
--env="DISPLAY" \ <br>
xination/geant4.10.06

note: -v mean to bind the volume. <br>
the first is path in host, and the second is for the path inside container. <br>
"rw" flag means read and write, <br>
"--rm" option means when the process is done, remove the container.
"-it" option means interactive mode. <br>


**2 RE-Build this Docker image** <br>
use build_docker_image.sh <br>
will take a while to run <br>

**3 update this Docker image** <br>
$ docker run -it -d xination/geant4.10.06
  # -it for interactive 
  # -d  for detach 

$ docker ps -a 
 # copy the corresponding container id.

 docker exec -it <CONTAINER_ID> bash 
 # then do something you want ... 
 # and then exit when you all done. 

$ docker commit <CONTAINER_ID> <NEW_IMAGENAME>:<tag>



--
ref: https://github.com/wtakase/docker-geant4
