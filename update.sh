#!/bin/sh
LAST_VER=`cat last_ver`
echo "Last version: $LAST_VER"
CURR_VER=`/home/user/.local/bin/lastversion pi-hole/docker-pi-hole`
echo "Current version: $CURR_VER"

if [ "$LAST_VER" != "$CURR_VER" ]; then
    echo "Upgrading docker image"
    echo "Pulling latest pihole"
    docker-compose --env-file settings.env pull
    echo "Stopping pihole"
    docker-compose --env-file settings.env stop
    echo $?
    echo "Removing containers"
    docker-compose --env-file settings.env rm -f
    echo $?
    echo "Starting pihole"
    docker-compose --env-file settings.env up -d
    echo $?
    echo -n "$CURR_VER" > last_ver
fi
