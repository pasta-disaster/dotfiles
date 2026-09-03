#!/usr/bin/env bash

VPN_SESSIONS=$(openvpn3 sessions-list)

if [ "$VPN_SESSIONS" = "No sessions available" ]; then
	exit 0
else
	exit 1
fi
