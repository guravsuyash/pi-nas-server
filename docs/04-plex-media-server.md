# 🎬 Step 04 – Plex Media Server Setup via Docker

This guide explains how to set up a **Plex Media Server** using Docker and Docker Compose on your Raspberry Pi. Plex allows you to stream and organize media like movies, TV shows, and music from any device on your network.

---

## 🔐 Step 1: Get Your User ID (UID)

To avoid permission issues, ensure Plex runs with your current user's ID, especially if that user owns your media files.

```bash
id -u
```

> 📌 Note: Save the number returned (e.g., 1000) — you will need it in the Docker Compose config.

## 📁 Step 2: Create a Directory for Plex Stack

Create a dedicated folder to store your Plex Docker setup:

```bash
sudo mkdir -p /opt/stacks/plex
cd /opt/stacks/plex
```

## 🔑 Step 3: Get Your Plex Claim Token

To link your Plex server to your Plex account, retrieve a **claim token**:

1. Visit: [https://www.plex.tv/claim](https://www.plex.tv/claim)
2. Sign in or create an account.
3. Copy the **claim code** shown on the page.

> ⚠️ This token **expires after 5 minutes**, so copy it close to the time you launch your container.

## 📝 Step 4: Create the Docker Compose File

Use a text editor like `nano` to create your [docker-compose-plex.yml](../docker/docker-compose-plex.yml) file:

```bash
sudo nano docker-compose-plex.yml
```

Paste the following configuration and replace all placeholder values:

```yaml
services:
  plex:
    container_name: plex
    image: plexinc/pms-docker
    restart: unless-stopped
    ports:
      - 32400:32400/tcp
      - 8324:8324/tcp
      - 32469:32469/tcp
      - 1900:1900/udp
      - 32410:32410/udp
      - 32412:32412/udp
      - 32413:32413/udp
      - 32414:32414/udp
    environment:
      - TZ=<TIMEZONE>
      - PLEX_CLAIM=<CLAIMTOKEN>
      - PLEX_UID=<USERID>
      - PLEX_GID=<USERID>
      - ADVERTISE_IP=http://<hostIPAddress>:32400/
    hostname: <hostname>
    volumes:
      - <path/to/plex/database>:/config
      - <path/to/transcode/temp>:/transcode
      - <path/to/media>:/data
    devices:
      - /dev/dri:/dev/dri  # Enables GPU hardware acceleration
```

### 🔁 Replace the following placeholders:

- `<USERID>` → Your user ID from `id -u` (e.g., `1000`)
- `<TIMEZONE>` → Your timezone (e.g., `Asia/Kolkata`, `America/New_York`)
- `<CLAIMTOKEN>` → Your Plex claim code
- `<path/to/media>` → Full path to your media directory (e.g., `/home/pi/media`)

## 🚀 Step 5: Launch the Plex Container

Once your `compose.yml` is ready and saved, start the container using:

```bash
docker compose up -d
```

This will download the Plex image and run it using your provided configuration.

---

## 🌐 Step 6: Access Plex Web UI

After the container starts, find your Pi’s IP address:

```bash
hostname -I
```

Visit Plex in your browser:

`https://<your-pi-ip>:32400/web`

> ⚠️ You might get a certificate warning due to the self-signed cert — proceed anyway.

---

## ✅ Outcome

- Plex Media Server is running in a Docker container.
- It's accessible from any device on your network.
- Your media is now organized and streamable via the Plex interface.