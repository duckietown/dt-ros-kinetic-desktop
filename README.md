# dt-ros-kinetic-desktop

Status:
[![Docker Hub](https://img.shields.io/docker/pulls/duckietown/dt-ros-kinetic-desktop.svg)](https://hub.docker.com/r/duckietown/dt-ros-kinetic-desktop)

## Build

```
docker build . -t duckietown/dt-ros-kinetic-desktop
```

## Run

```
docker run -p 6080:6080 [-v `pwd`/workspaceSrc:/home/ros/workspace/src] duckietown/dt-ros-kinetic-desktop
```

## URL

http://localhost:6080/vnc.html
