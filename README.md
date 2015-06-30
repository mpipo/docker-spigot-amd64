# docker-spigot-amd64
Spigot server for AMD64/EM64T

How to use:

- You need to accept the Minecraft EULA by running:

```
docker run -e EULA=true mpipo/spigot-amd64
```

- You might want to mount the server dir to somewhere on the host.

```
docker run -v /some/where/on/host:/minecraft mpipo/spigot-amd64
```

- Spigot's BuildTools doesn't select any version as default, you must specify it as well.

```
docker run -e BUILD_VERSION=1.8.7 mpipo/spigot-amd64
```

- Don't forget to port forward!

```
docker run -p hostport:25565 mpipo/spigot-amd64
```

- If spigot.jar is not found, running the container will automagically build one for you.

Add those together and you'll get something like this:
```
docker run -e EULA=true -p 25565:25565 -v /home/mpipo/mcserver:/minecraft --name spigot mpipo/spigot-amd64
```

**IF YOU WANT TO MOUNT VOLUMES AS A BIND, YOU NEED TO ADD AN ACCOUNT NAMED "MINECRAFT" IN YOUR HOST, OR BAD THINGS WILL HAPPEN!**

## Additional flags

Add `-e MINMEM={number}` to change the minimum memory allocation.

The same for max memory `-e MAXMEM={number}`

Additional parameters can be parsed using `-e ADDPARAMS={foobar}`

## Reporting bugs

Please use GitHub's Issues page to report any bugs. **PLEASE BE CONSTRUCTIVE AND PROVIDE LOGS**
