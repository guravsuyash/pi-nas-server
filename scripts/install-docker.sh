#!/bin/bash

# ------------------------------------------
# install-docker.sh
# Official method to install Docker on Raspbian
# Works for Raspberry Pi OS (64-bit)
# ------------------------------------------

# Exit on any error
set -e

echo "🐳 Starting Docker installation on Raspberry Pi..."

# ------------------------------------------
# Step 1: Update the package list
# ------------------------------------------
echo "📦 Updating package list..."
sudo apt-get update

# ------------------------------------------
# Step 2: Install dependencies for Docker setup
# ------------------------------------------
echo "🔧 Installing required packages..."
sudo apt-get install -y ca-certificates curl

# ------------------------------------------
# Step 3: Create keyrings directory for Docker GPG key
# ------------------------------------------
echo "📂 Creating keyrings directory..."
sudo install -m 0755 -d /etc/apt/keyrings

# ------------------------------------------
# Step 4: Add Docker’s official GPG key
# ------------------------------------------
echo "🔑 Adding Docker GPG key..."
sudo curl -fsSL https://download.docker.com/linux/raspbian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# ------------------------------------------
# Step 5: Set up the Docker APT repository
# ------------------------------------------
echo "📄 Adding Docker repository to APT sources..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/raspbian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# ------------------------------------------
# Step 6: Update APT again with Docker repo
# ------------------------------------------
echo "🔄 Updating APT sources with Docker repo..."
sudo apt-get update

# ------------------------------------------
# Step 7: Install Docker Engine and plugins
# ------------------------------------------
echo "⚙️ Installing Docker components..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# ------------------------------------------
# Done!
# ------------------------------------------
echo ""
echo "✅ Docker installation complete!"
echo "🔁 You may want to reboot: sudo reboot"
echo "🔍 Verify with: docker --version"
echo ""
