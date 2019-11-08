# geant4_dockerfile
geant4.10.05 based on Ubuntu 18.04

**0 Get the Docker image from Dockerhub** <br>
$ docker pull xination/geant4.10.05

**1 Build the Docker image from Dockerfile** <br>
Download the files( Dockerfile and entry-point.sh) <br>
$ docker build -t __aName__ . <br>
will take a while to run 

**2 run ** <br>
docker run --rm -it \\<br>
-v "YOUR_PATH_for_geant4_data:/opt/geant4/data" \ <br>
--volume="$HOME/.Xauthority:/root/.Xauthority:rw" \ <br>
--net=host \ <br>
--env="DISPLAY" \ <br>
xination/geant4.10.05

note: -v mean to bind the volume. the first is path in host, and the second is for the path inside container. <br>
"rw" flag means read and write, <br>
"ro" flag means read only (not in used). <br>
"--rm" option means when the process is done, remove the container.
"-it" option means interactive mode.

--
ref: https://github.com/wtakase/docker-geant4
