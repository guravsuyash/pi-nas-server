# 🛠️ Step 01 – Raspbian Setup & Docker Installation

This document covers the initial setup of Raspberry Pi for use as a headless NAS server with Docker support.

---

## 🍏 Creating a Bootable Raspbian OS (on macOS)

- Used **Raspberry Pi Imager** to make a Bootable SD Card.
- Selected **Raspberry Pi OS (64-bit, Lite)** for a **headless**, **no-GUI** setup.
- Configured:
  - **Wireless credentials** (SSID and password).
  - **HDMI output** for temporary display if needed.
  - **Hostname:** `openmediavault`.

---

## 🖥️ Initial Setup on First Boot

SSH into the Pi using the IP address assigned (from your router or Bonjour `.local` if enabled).
You would get this IP address from IP scanner tools or your router setup page 

Commands:
```bash
hostnamectl set-hostname openmediavault # Change Hostname to openmediavault
sudo apt update && sudo apt upgrade -y # Downloads the latest package lists, including versions and dependencies
```

## 🐳 Installing Docker (Official Method)
```bash
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/raspbian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```

## Add Docker Repository
```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/raspbian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

## Install Docker Engine
```bash
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
---

