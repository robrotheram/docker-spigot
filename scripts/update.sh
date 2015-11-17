#!/bin/bash
# With many thanks to Robrotheram for this script
# http://gist.github.com/robrotheram/5ffac65aed7ba43a8425

# Move to script's dir
UA="Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36"
# Create backup dir
dt=$(date +%Y%m%d%H%M%S)
mkdir plugins_$dt

# Copy jar to backup
cp *.jar plugins_$dt/.
rm *.jar

function getFile
{
    local file=$1
    local url=$2

    echo "* Fetching '$1' from '$2'"
    wget --user-agent="$UA" --connect-timeout 5 -O $1 $2 &> last.err

    if [ $? -ne 0 ]; then
        echo -e "*** ERROR downloading $2\n\n"
        cat last.err
        echo -e "\n\n*** ERROR! Please review above log"
        echo -e "*** ERROR! Please review above log"
        echo -e "*** ERROR! Please review above log"
    fi
}

# BookExploitFix
cp /home/minecraft/Build/BookExploitFix/BookExploitFix.jar .
# CraftBook
getFile CraftBook.zip http://dl.dropboxusercontent.com/u/20806998/mc/CraftBook%203.9.zip
# Dynmap
getFile dynmap-HEAD.jar http://mikeprimm.com/dynmap/builds/dynmap/dynmap-HEAD.jar
# Essentials
getFile Essentials-2.x-SNAPSHOT.jar http://hub.spigotmc.org/jenkins/job/Spigot-Essentials/lastSuccessfulBuild/artifact/Essentials/target/Essentials-2.x-SNAPSHOT.jar
# HappyPet
cp /home/minecraft/Build/HappyPet/target/HappyPet-1.1-SNAPSHOT.jar .
# LWC
getFile LWC.jar http://artifacts.getlwc.org/Hidendra/LWC/240/240.1/core/target/LWC.jar

# Multiverse-Core & portals are buggy and requires fixes for Portals
getFile Multiverse-Core-2.5.jar http://ci.onarandombox.com/job/Multiverse-Core/lastSuccessfulBuild/artifact/target/Multiverse-Core-2.5.jar

getFile Multiverse-Inventories-2.5.jar http://ci.onarandombox.com/job/Multiverse-Inventories/lastSuccessfulBuild/artifact/target/Multiverse-Inventories-2.5.jar
# PRISM
getFile prism-2.0.6.jar "http://dhmc.us:8080/job/Prism/lastSuccessfulBuild/me.botsko\$prism/artifact/me.botsko/prism/2.0.6/prism-2.0.6.jar"
# ProtocolLib
getFile ProtocolLib.jar http://ci.shadowvolt.com/job/ProtocolLib/lastSuccessfulBuild/artifact/target/ProtocolLib.jar
# PurpleIRC (version locked)
getFile PurpleIRC.jar http://h.cnaude.org:8081/job/PurpleIRC-spigot/lastSuccessfulBuild/artifact/target/PurpleIRC.jar
# SignShop
getFile SignShop.jar http://signshop.beastmc.com/job/Signshop/lastSuccessfulBuild/artifact/dist/SignShop.jar
# SimpleBroadcast
getFile SimpleBroadcast.jar http://dev.bukkit.org/media/files/857/564/SimpleBroadcast.jar
# SQlibrary
getFile SQLibrary-7.1.jar http://dev.bukkit.org/media/files/767/49/SQLibrary-7.1.jar
# Stables
getFile Stables.jar http://dev.bukkit.org/media/files/879/195/Stables.jar
# Skript
getFile Skript.jar http://dev.bukkit.org/media/files/779/542/Skript.jar
# TerrainControl
getFile terraincontrol-bukkit-2.7.2-SNAPSHOT.jar http://build.mctcp.com/job/TerrainControl%20-%20Master%20-%20Gradle/default/lastSuccessfulBuild/artifact/platforms/bukkit/build/distributions/terraincontrol-bukkit-2.7.2-SNAPSHOT.jar
# TicketMaster
# depricated Ticketmaster getFile TicketMaster.jar http://dev.bukkit.org/media/files/809/740/TicketMaster.jar
getFile ticket-master.jar http://github.com/robrotheram/ticket-master/releases/download/v1.1/ticket-master.jar

# ToughBoats (Gamealition fork)
cp /home/minecraft/Build/ToughBoats/target/ToughBoats-1.4-SNAPSHOT.jar .
# Vault
getFile Vault.jar http://dev.bukkit.org/media/files/865/213/Vault.jar
# VanishNoPacket
getFile VanishNoPacket.jar http://dev.bukkit.org/media/files/787/504/VanishNoPacket.jar
# WorldBorder
getFile WorldBorder.jar http://dev.bukkit.org/media/files/883/629/WorldBorder.jar
# WorldEdit
getFile worldedit-bukkit-6.1.1-SNAPSHOT-dist.jar http://builds.enginehub.org/job/worldedit/7094/download/worldedit-bukkit-6.1.1-SNAPSHOT-dist.jar
# worldGuard
getFile worldguard-6.1.1-SNAPSHOT.zip http://builds.enginehub.org/job/worldguard/7096/download/worldguard-6.1.1-SNAPSHOT.zip
# zPerms
getFile zPermissions-1.3-SNAPSHOT-b9.jar http://hub.spigotmc.org/jenkins/job/zPermissions/lastSuccessfulBuild/artifact/target/zPermissions-1.3-SNAPSHOT-b9.jar

#getFile UHCReloaded-1.3-SNAPSHOT.jar  http://jenkins.carrade.eu/job/UltraHardcoreReloaded/lastStableBuild/artifact/target/UHCReloaded-1.3-SNAPSHOT.jar

getFile ProtocolLib.jar http://dev.bukkit.org/media/files/888/760/ProtocolLib.jar

#getFile SpectatorPlus-B2.1.jar  http://jenkins.carrade.eu/job/SpectatorPlus/lastStableBuild/artifact/SpectatorPlus/target/SpectatorPlus-B2.1.jar
# unzip any downloaded zip files
unzip -qo worldguard-6.1.1-SNAPSHOT.zip
unzip -qo CraftBook.zip

# Clean up of inflating zips
rm *.zip
rm *.html
rm *.txt
