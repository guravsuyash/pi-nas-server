# 🌐 Step 07 – Network Configuration (LAN + WLAN)

In this step, the Raspberry Pi running **OpenMediaVault (OMV)** was configured to use both **wired (LAN)** and **wireless (WLAN)** connections for easier setup and testing purposes.

> ⚠️ Note: This setup is intended for **testing only**. For production use, it is highly recommended to use **only Ethernet (LAN)** for stability and performance.

---

## 🔧 Why Both LAN and WLAN?

- 📱 **Wireless (WLAN)** was enabled temporarily to allow easier access during setup and mobility.
- 🔌 **LAN** was used for consistent access to the OMV web UI, especially during WiFi disruptions post-OMV install.
- This hybrid network mode was helpful during:
  - Headless installation
  - IP discovery via HDMI
  - Reconfiguring WiFi through OMV GUI

---

## 🗺️ Current Test Setup

| Interface | Purpose               | Status   |
|-----------|------------------------|----------|
| `eth0`    | Wired Ethernet         | Enabled  |
| `wlan0`   | Wireless for testing   | Enabled (temporary) |

You can check current interfaces using:

```bash
ip addr
```

## ⚙️ Configuring WLAN via OMV GUI

1. Log in to **OMV Web UI**
    
2. Navigate to:  
    **System → Network → Interfaces**
    
3. Add a new interface:
    
    - Name: `wlan0`    
    - Mode: DHCP or Static (your choice)
    - Enable checkbox: ✅
        
4. Apply and Save changes
    

---

## 🚫 Production Considerations

- **WiFi is not recommended** for NAS setups due to:
    - Packet loss
    - Fluctuating IPs
    - Lower transfer speeds
- Ethernet ensures stability, especially for:
    - SMB/CIFS file shares
    - Docker services        
    - Plex or media streaming


---

## ✅ Outcome

- LAN + WLAN both configured for convenience during setup
- Device accessible from both wired and wireless networks
- Network interface management validated via OMV UI