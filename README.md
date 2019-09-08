# Instructions

## Build

```
docker build . -t duckietown/dt-ros-kinetic-desktop
```

## Run

```
docker run -p 6080:6080 -v `pwd`/workspaceSrc:/home/ros/workspace/src
```

http://localhost:6080/vnc.html
