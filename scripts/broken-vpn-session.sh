#!/usr/bin/env bash

#VPN_SESSIONS=$(openvpn3 sessions-list)

VPN_SESSIONS=$(openvpn3 sessions-list | grep "Authentication failed" | wc -l)


if [ "$VPN_SESSIONS" = "1" ]; then
	exit 0
else
	exit 1
fi
