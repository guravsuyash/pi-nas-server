# 💾 Step 06 – Storage Setup & Mounting (Non-Production USB Drive)

This step walks you through **setting up and mounting a USB drive** as storage for your Raspberry Pi NAS. This is particularly useful for testing, file sharing, or media server storage.

> ⚠️ Note: This setup is intended for **testing purposes only** and uses the CLI instead of OMV’s built-in web interface.

---

## 🧱 Storage Overview

- Device: USB pendrive (e.g., `/dev/sda1`)
- Filesystem: `ext4`
- Mount Path: `/srv/dev-disk-by-label-media`
- Persistence: Enabled via `/etc/fstab`

---

## 🧰 Requirements

Before proceeding, make sure you have:

- A freshly formatted drive (or format it using `sudo mkfs.ext4 /dev/sda1`)
- Identified the correct device name using:
  ```bash
  lsblk
```

- SSH or terminal access to your Raspberry Pi

## ⚙️ Bash Script – `mount-storage.sh`

This script handles:

- Creating a mount point
- Assigning a label
- Updating `/etc/fstab` for persistent mounting
- Mounting the device immediately
### 📄 Script: `mount-storage.sh`

[mount-storage.sh](../scripts/mount-storage.sh)

## 🚀 Usage

```bash
chmod +x mount-storage.sh 
sudo ./mount-storage.sh`
```

---

## 🧪 Verification

Check that the disk is mounted correctly:

```bash
df -h
```

You should see your USB storage mounted under `/srv/dev-disk-by-label-media`.

---

## 🧠 Notes

- This method avoids the OMV GUI and is ideal for scripting/testing.
- For production, consider letting OMV handle disk mounting to prevent conflicts.
- You can still create shared folders and enable services (FTP/NFS/SMB) using OMV Web UI afterward.

---

## ✅ Outcome

- A USB drive is mounted at `/srv/dev-disk-by-label-media`
- It’s persistent across reboots via `/etc/fstab`
- It’s ready for use with OMV shared folders and services