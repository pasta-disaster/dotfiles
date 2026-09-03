#!/usr/bin/env bash

if [ -z $1 ]; then
	exit 1
fi

VPN_SESSION=$(openvpn3 sessions-list | grep "Config name: $1")

if [ -z "$VPN_SESSION" ]; then
	openvpn3 session-start --config $1
else
	openvpn3 session-manage -D --config $1
fi
