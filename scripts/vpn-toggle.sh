#!/bin/bash
# VPN Toggle Script - Connect or disconnect OpenVPN3 sessions

connect_vpn() {
    local OVPN_CONFIG="$1"
    
    # Extract DNS settings from config
    VPN_DNS=$(grep "^# VPN_DNS=" "$OVPN_CONFIG" | cut -d'=' -f2)
    VPN_DOMAINS=$(grep "^# VPN_DOMAINS=" "$OVPN_CONFIG" | cut -d'=' -f2)
    
    # Start the VPN connection
    echo "Starting VPN connection..."
    openvpn3 session-start --config "$OVPN_CONFIG"
    
    # Wait for interface to come up
    echo "Waiting for VPN interface..."
    for i in {1..30}; do
        INTERFACE=$(ip link show 2>/dev/null | grep -o 'tun[0-9]\+' | head -1)
        if [ -n "$INTERFACE" ]; then
            echo "Found interface: $INTERFACE"
            break
        fi
        sleep 1
    done
    
    if [ -z "$INTERFACE" ]; then
        echo "Error: VPN interface not found"
        return 1
    fi
    
    # Apply DNS configuration
    if [ -n "$VPN_DNS" ]; then
        echo "Configuring DNS: $VPN_DNS"
        sudo resolvectl dns "$INTERFACE" $VPN_DNS
    fi
    
    if [ -n "$VPN_DOMAINS" ]; then
        echo "Configuring domains: $VPN_DOMAINS"
        sudo resolvectl domain "$INTERFACE" $VPN_DOMAINS
    fi
    
    echo "VPN connected and DNS configured!"
    echo "Interface: $INTERFACE"
    resolvectl status "$INTERFACE"
}

disconnect_vpn() {
    local OVPN_CONFIG="$1"
    
    echo "Disconnecting VPN..."
    openvpn3 session-manage --config "$OVPN_CONFIG" --disconnect
    
    if [ $? -eq 0 ]; then
        echo "VPN disconnected successfully!"
    else
        echo "Error disconnecting VPN"
        return 1
    fi
}

is_connected() {
    local OVPN_CONFIG="$1"
    local CONFIG_NAME=$(basename "$OVPN_CONFIG")
    
    # Check if there's an active session with this config
    openvpn3 sessions-list 2>/dev/null | grep -q "$CONFIG_NAME"
    return $?
}

# Main script logic
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/config.ovpn"
    exit 1
fi

OVPN_CONFIG="$1"

if [ ! -f "$OVPN_CONFIG" ]; then
    echo "Error: Config file not found: $OVPN_CONFIG"
    exit 1
fi

# Check connection status and toggle
if is_connected "$OVPN_CONFIG"; then
    echo "VPN is currently connected. Disconnecting..."
    disconnect_vpn "$OVPN_CONFIG"
else
    echo "VPN is not connected. Connecting..."
    connect_vpn "$OVPN_CONFIG"
fi
