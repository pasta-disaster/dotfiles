#!/usr/bin/env bash

VPN_SESSIONS=$(openvpn3 sessions-list)

if [ "$VPN_SESSIONS" = "No sessions available" ]; then
	exit 1
elif [[ $VPN_SESSIONS == *"Authentication failed"* ]]; then
	exit 1
else
	exit 0
fi
