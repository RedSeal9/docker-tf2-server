## Team Fortress 2 + Docker

Basic Team Fortress 2 server

```
docker pull redseel/tf2:latest
```

### Server ###
This server is meant for use in the cloud
To make the image tiny, the server is downloaded the first time the server is ran.

## Running the Server

```shell

# Run image with default options
docker run -d -p 27015:27015/udp redseel/tf2:latest

# Run image with custom options
docker run -d -p 27015:27015/udp redseel/tf2:latest +sv_pure 2 +map pl_badwater.bsp +maxplayers 32

```

This repo is meant for the cloud (specifically GCE with containers).
