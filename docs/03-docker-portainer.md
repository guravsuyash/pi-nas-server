# 🐳 Step 03 – Docker & Portainer 

With OpenMediaVault installed, the next step is to install **Portainer**, a lightweight web UI for managing Docker containers. This will allow you to deploy and monitor services with ease.

---

## 🔄 Update System Packages

Before installing anything, ensure your system packages are up-to-date:

```bash
sudo apt update && sudo apt -y upgrade
```

## 📥 Pull Portainer Image

Download the latest Portainer Community Edition image:

```bash
docker pull portainer/portainer-ce:latest
```

## 💾 Create Docker Volume for Portainer Data

Create a persistent volume to store Portainer's configuration:

```bash
docker volume create portainer_data
```

## 🚀 Run Portainer Container

Start the Portainer container with necessary ports and volumes:

```bash
docker run -d \
  -p 8000:8000 \
  -p 9443:9443 \
  --name=portainer \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce:latest
```

Or you can use a [portainer-compose.yml](../docker/compose/portainer-compose.yml) file to run it 
## 🌐 Access Portainer Web UI

Get your Raspberry Pi's local IP:

```bash
hostname -I
```

Access the Portainer UI from a browser:

`https://<your-pi-ip>:9443`

> ⚠️ Portainer uses HTTPS on port 9443 by default. You might get a browser warning about the self-signed certificate — you can safely proceed.

## 👤 Initial Setup

Once Portainer is running:
1. Create an admin user – This will be your login credential.
2. Choose Docker environment – Select the Docker option (first one) to manage your local Raspberry Pi Docker engine.

---

## ✅ Outcome

- Portainer is now running and accessible at `https://<your-pi-ip>:9443`
- You can visually manage Docker containers, volumes, images, and networks
- Ready to deploy future services (like Plex, Apache, etc.) using the web UI
