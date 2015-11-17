#!/bin/bash

if [ "$EULA" != "true" ]; then
  echo "*****************************************************************"
  echo "*****************************************************************"
  echo "** To be able to run spigot you need to accept minecrafts EULA **"
  echo "** see https://account.mojang.com/documents/minecraft_eula     **"
  echo "** include -e EULA=true on the docker run command              **"
  echo "*****************************************************************"
  echo "*****************************************************************"
  exit
fi






if [ ! -f "/minecraft/spigot.jar" ]; then
  echo "building spigot"
	mkdir /Build
	cd /Build
	wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
	java -jar BuildTools.jar
	cp spigot*.jar /minecraft/spigot.jar
	cd /minecraft
  echo "eula=true">eula.txt
	mkdir plugins
	cd /minecraft/plugins
 	if [ ! -f "/minecraft/plugins/update.sh" ]; then
		cp /update.sh .
	if
	./update.sh
  echo "first build"
  cd /minecraft
  else
	echo "no build"
fi



cd /minecraft/plugins
cp /update.sh .
./update.sh

echo "plugin update please Wait"
cd /
./pluginEdit


echo "Starting the server"
cp /start.sh /minecraft/start.sh

cd /minecraft
./start.sh

bash
