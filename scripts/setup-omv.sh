#!/bin/bash

# ------------------------------------------
# setup-omv.sh
# Script to install OpenMediaVault (OMV)
# on a Raspberry Pi running Raspbian OS
# ------------------------------------------

# Exit immediately if a command fails
set -e

# Print banner
echo "🔧 Starting OpenMediaVault installation..."

# Fetch and run the official OMV installation script from GitHub
# This script:
# - Installs OMV and its required packages
# - Sets up configuration for services
# - Prepares the web-based management interface

echo "📥 Downloading and executing OMV install script..."
wget -O - https://raw.githubusercontent.com/OpenMediaVault-Plugin-Developers/installScript/master/install | sudo bash

# Notify user to reboot after install
echo "✅ OpenMediaVault installation script complete."
echo "🔁 Please reboot the system to apply changes:"
echo ""
echo "    sudo reboot"
echo ""
