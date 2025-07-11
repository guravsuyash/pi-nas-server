# 🧱 Step 02 – OpenMediaVault (OMV) Installation

After preparing your Raspberry Pi with Docker and a configured hostname, the next step is to install **OpenMediaVault** — a web-based NAS solution perfect for home lab and Pi-based storage setups.

---

## ⚙️ Install OpenMediaVault (OMV)

Run the official installation script provided by the OpenMediaVault Plugin Developers:

```bash
wget -O - https://raw.githubusercontent.com/OpenMediaVault-Plugin-Developers/installScript/master/install | sudo bash
```

```bash
sudo reboot # Reboot the machine 
```

## ⚠️ Note on WiFi Disruption
After installation, the default WiFi connection was disrupted on the Raspberry Pi. As a workaround:
- Connected a display via HDMI to view the local IP address.
- Accessed the OMV Web UI from the displayed IP.
- Reconfigured WiFi connection manually via the GUI.

⚠️ This setup is for testing purposes only and not intended for production. Ethernet is recommended for reliability in real-world use.

## 🌐 Accessing OMV Web UI
Once IP is known, open in a browser:

http://<raspberry-pi-ip></raspberry-pi-ip>

Default credentials:
- **Username**: admin
- **Password**: openmediavault

## 🔧 GUI Setup Tasks (via OMV Web Interface)
1. **🔑 Change Default Admin Password**
   - Navigate to **System → General Settings → Web Administrator Password**

2. **📁 Create and Mount Test Storage (USB Drive)**
   - Using a pendrive as test storage only (not for production use).
   - Go to **Storage → Disks**
     - Select USB drive → **Wipe (Quick)**
   - Go to **Storage → File Systems**
     - **Create** → Select device → Format as **ext4** → **Mount** it

3. **📂 Create Shared Folder**
   - Navigate to **Access Rights Management → Shared Folders**
   - Click **Add**, choose the mounted filesystem, and give it a name

4. **📡 Enable File Services**
   - Enable basic network file protocols for cross-device sharing:
     - **FTP**: Enable under **Services → FTP**
     - **NFS**: Enable under **Services → NFS**
     - **SMB/CIFS (Windows/Mac)**: Enable under **Services → SMB/CIFS**
   - Ensure shared folder permissions are correctly applied under each service.

5. **👤 Create a User for File Access**
   - Go to **Access Rights Management → User**
   - Create a new user → Assign to shared folder with proper permissions

**✅ Outcome**
- OpenMediaVault is installed and accessible via web UI
- A test USB drive is mounted as ext4 storage
- Shared folders are configured and accessible via FTP, NFS, and SMB
- A user is created for upload/download access