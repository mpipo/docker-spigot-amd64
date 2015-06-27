#!/bin/bash

startmc() {
	java -Xms$MINMEM -Xmx$MAXMEM $ADDPARAMS -jar spigot.jar
}

accepteula() {
if [ "$EULA" = "true" ]; then
	echo "eula=true" > "/minecraft/eula.txt"
else
	echo "You need to use the accepteula parameter."
	echo "Exiting..."
	exit 1
fi
}

buildspigot() {
	mkdir -p /minecraft/build
	cd /minecraft/build
	wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
	HOME=/minecraft/build java -jar BuildTools.jar
	cp /minecraft/build/Spigot/Spigot-Server/target/spigot-1.8*.jar /minecraft/spigot.jar
}

if [ -f /minecraft/eula.txt ]; then
	:
else
	accepteula
fi

if [ -f /minecraft/spigot.jar ]; then
	startmc
else
	buildspigot
fi