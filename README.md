# docker-acestream-arm

[Check in Dockerhub](https://hub.docker.com/r/danielchc/acestream-arm)

Docker image to run acestream-engine in RaspberryPI or armv7 system.

## How to build
```
docker build -t acestream-arm .
```
If you want build image with custom configuration, uncomment the line 
```
ADD acestream.conf  /acestream.engine/
```


## How to run
To run with default config
```
docker run -it --rm --privileged -p8621:8621 -p6878:6878  acestream-arm
```
If you want a custom configuration
```
docker run -it --rm --privileged -v $(pwd)/acestream.conf:/acestream.engine/acestream.conf -p8621:8621 -p6878:6878  acestream-arm
```

## How to play
Acestream can be played using next url
```
http://<docker_host>:6878/ace/getstream?id=<ID>
```

## Acestream Settings
```
http://<docker_host>:6878/webui/app/acestream/server#proxy-server-settings
```
