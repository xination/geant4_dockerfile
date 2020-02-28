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

<p>
note: -v mean to bind the volume. <br>
the first is path in host, and the second is for the path inside container. <br>
"rw" flag means read and write, <br>
"--rm" option means when the process is done, remove the container.
"-it" option means interactive mode. <br>
</p>

**2 RE-Build this Docker image:** <br>
use build_docker_image.sh <br>
will take a while to run <br>

**3 update this Docker image:** <br>
<p>
$ docker run -it -d xination/geant4.10.06 <br>
  # -it for interactive <br>
  # -d  for detach <br>
</p>
<p>
$ docker ps -a <br>
 # copy the corresponding container id. 
</p>
<br>
 docker exec -it <CONTAINER_ID> bash <br>
 # then do something you want ... <br>
 # and then exit when you all done. <br>
<br>
$ docker commit <CONTAINER_ID> <NEW_IMAGENAME>:<tag> <br>



--
ref: https://github.com/wtakase/docker-geant4
