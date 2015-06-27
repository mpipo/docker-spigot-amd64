# docker-spigot-amd64
Spigot server for AMD64/EM64T

How to use:

- You need to accept the Minecraft EULA by running:

```
docker run mpipo/spigot-amd64 accepteula
```

- You might want to mount the server dir to somewhere on the host.

```
docker run -v /some/where/on/host:/minecraft
```

- If spigot.jar is not found, running the container will automagically build one for you.

Not tested.
