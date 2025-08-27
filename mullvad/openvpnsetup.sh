#!/bin/bash

# ==============================
# Mullvad VPN Setup Script (Arch)
# ==============================
# This script will:
#  - Log in to your Mullvad account
#  - Set OpenVPN protocol with TCP (port 443) for obfuscation
#  - Enable bridge (Shadowsocks) mode
#  - Set a specific location (edit as needed)
#  - Enable auto-connect on boot
#  - Connect to the VPN and show status
# ==============================

# ---- CONFIGURATION ----
# Add your Mullvad account number below
MULLVAD_ACCOUNT="YOUR_MULLVAD_ACCOUNT_NUMBER"
# Set your preferred location (list with: mullvad relay list | grep -i <city>)
LOCATION="gb-lon-ovpn-002"   # Example: London, UK
# =======================

set -e

### 1. Check for root privileges (required for some Mullvad commands)
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root (sudo $0)"
    exit 1
fi

### 2. Install Mullvad CLI if not installed
if ! command -v mullvad &> /dev/null; then
    echo "Mullvad CLI not found. Installing..."
    pacman -Sy --needed --noconfirm mullvad-vpn
fi

### 3. Login to Mullvad
if ! mullvad account get | grep -q "Account"; then
    if [ -z "$MULLVAD_ACCOUNT" ] || [ "$MULLVAD_ACCOUNT" = "YOUR_MULLVAD_ACCOUNT_NUMBER" ]; then
        echo "Edit this script and set your Mullvad account number in MULLVAD_ACCOUNT."
        exit 1
    fi
    echo "Logging in to Mullvad..."
    mullvad account login "$MULLVAD_ACCOUNT"
fi

### 4. Enable auto-connect on boot
echo "Enabling Mullvad auto-connect..."
mullvad auto-connect set on

### 5. Set tunnel protocol to OpenVPN
echo "Setting tunnel protocol to OpenVPN..."
mullvad relay set tunnel-protocol openvpn

### 6. Set OpenVPN to use TCP and port 443
echo "Setting OpenVPN to use TCP and port 443..."
mullvad relay set tunnel openvpn --transport-protocol tcp --port 443

### 7. Enable bridge (Shadowsocks) mode
echo "Enabling Shadowsocks bridge mode..."
mullvad bridge set state on

### 8. Set relay location
echo "Setting location to $LOCATION..."
mullvad relay set location "$LOCATION"

### 9. Connect to Mullvad VPN
echo "Connecting to Mullvad VPN..."
mullvad connect

### 10. Show VPN status
echo "VPN connection status:"
mullvad status -v

echo "-----------------------------"
echo "Mullvad VPN setup complete!"
echo "Auto-connect is enabled."
echo "You can check status anytime with: mullvad status -v"
