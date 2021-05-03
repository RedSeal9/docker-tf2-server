## Team Fortress 2 + Docker

Basic Team Fortress 2 server

[![Docker CI](https://github.com/RedSeal9/docker-tf2-server/actions/workflows/docker-ci.yml/badge.svg?event=push)](https://github.com/RedSeal9/docker-tf2-server/actions/workflows/docker-ci.yml)
```
docker pull redseel/tf2:latest
```

### Server ###
This server is meant for use in the cloud.  To make the image tiny, the server is downloaded the first time the server is ran.

## Running the Server

```shell

# Run image with default options
docker run -d -p 27015:27015/udp redseel/tf2:latest

# Run image with custom options
docker run -d -p 27015:27015/udp redseel/tf2:latest +sv_pure 2 +map pl_badwater.bsp +maxplayers 32

```
