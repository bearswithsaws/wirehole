#!/bin/sh
LAST_VER=`cat last_ver`
echo "Last version: $LAST_VER"
CURR_VER=`/home/user/.local/bin/lastversion pi-hole/docker-pi-hole`
echo "Current version: $CURR_VER"

if [ "$LAST_VER" != "$CURR_VER" ]; then
    echo "Upgrading docker image"
    echo "Stopping pihole"
    /snap/bin/docker-compose stop
    echo $?
    echo "Removing containers"
    /snap/bin/docker-compose rm -f
    echo $?
    echo "Pulling latest pihole"
    /snap/bin/docker-compose pull
    echo "Starting pihole"
    /snap/bin/docker-compose up -d
    echo $?
    echo -n "$CURR_VER" > last_ver
fi
