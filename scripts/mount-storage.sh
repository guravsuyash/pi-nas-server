#!/bin/bash

# ----------------------------------------
# mount-storage.sh – Automate storage setup on Raspberry Pi (non-production OMV)
# ----------------------------------------

set -e

# 👉 Change this to your actual device (e.g. /dev/sda1 or use lsblk to confirm)
DEVICE="/dev/sda1"
LABEL="media"
MOUNT_POINT="/srv/dev-disk-by-label-$LABEL"

echo "📦 Creating mount point at $MOUNT_POINT..."
sudo mkdir -p "$MOUNT_POINT"

echo "🔠 Labeling device as $LABEL..."
sudo e2label "$DEVICE" "$LABEL"

echo "📛 Setting permissions..."
sudo chown -R pi:pi "$MOUNT_POINT"
sudo chmod 755 "$MOUNT_POINT"

echo "🔗 Updating /etc/fstab for persistence..."

UUID=$(sudo blkid -s UUID -o value "$DEVICE")

# Backup fstab
sudo cp /etc/fstab /etc/fstab.bak

# Append entry to fstab
echo "UUID=$UUID  $MOUNT_POINT  ext4  defaults,nofail  0  2" | sudo tee -a /etc/fstab

echo "🔌 Mounting $DEVICE..."
sudo mount -a

echo "✅ Done. Mounted $DEVICE at $MOUNT_POINT"
