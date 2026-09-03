#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "$0")
CACHE_FILE=~/.openvpn3/sessions

cache() {
    openvpn3 sessions-list | grep "Config name:" | awk -F' ' '{print $3}' > $CACHE_FILE
    echo "Sessions cached to $CACHE_FILE"
}

# no profile specified
if [ -z $1 ]; then
    echo
	exit 1
fi

# cache sessions if needed
if [ "$1" = "--cache" ]; then
	cache
	exit 0
fi

# regular connection/disconnection
VPN_SESSION=$(openvpn3 sessions-list | grep "Config name: $1")

if [ -z "$VPN_SESSION" ]; then
	openvpn3 session-start --config $1
else
	openvpn3 session-manage -D --config $1
fi

cache
