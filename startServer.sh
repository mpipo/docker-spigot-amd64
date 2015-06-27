#!/bin/bash

startmc() {
	java -Xms$MINMEM -Xmx$MAXMEM $ADDPARAMS -jar spigot.jar
}

accepteula() {
if [ "$1" = "accepteula" ]; then
	echo "eula=true" > ~/eula.txt"
else
	echo "You need to use the accepteula parameter."
	echo "Exiting..."
	exit 1
}

buildspigot() {
	mkdir -p /minecraft/build
	cd /minecraft/build
	wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
	HOME=/minecraft/build java -jar BuildTools.jar
	cp /minecraft/build/Spigot/Spigot-Server/target/spigot-1.8*.jar /minecraft/spigot.jar
}

if [ $(cat ~/eula.txt) = "eula=true" ]; then
	:
else
	accepteula
fi

if [ -f ~/spigot.jar ]; then
	startmc
else
	buildspigot
fi