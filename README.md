# wirehole
Simple pi-hole + WireGuard setup

# Requirements

`lastversion`

https://github.com/dvershinin/lastversion

Used to check for the most recent version of pi-hole when determining to upgrade.

# Setup

Edit `settings.env`. These environment variables are just an easy place to put all the configurable variables for both pi-hole and WireGuard containers.

## Example

At a minimum, the `settings.env` should contain:

```bash
TZ='America/New York'
WEBPASSWORD='password'
SERVERURL=<url pointing to VPN server IP>
PEERS=1
INTERNAL_SUBNET=192.168.2.1
WIREGUARD_CONFIG_DIR=/path/to/wireguard-docker/appdata/config
```

# Configure Update Script

Edit the update script to point at the installation of `lastversion`.

The `update.sh` script is intended to be run as a cron job at an interval of once a day. This will check to see if the pi-hole docker project has been updated, and if so, perform an update.

## Example

```
0 0 * * * cd /path/to/wirehole && ./update.sh 1> output.txt
``` 
