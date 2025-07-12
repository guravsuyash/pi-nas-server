# 🌐 Step 05 – Apache Web Server as Reverse Proxy (PHP 7.4 FPM)

In this step, we configure an **Apache web server** running in Docker to act as a **reverse proxy** for a **PHP 7.4 FPM container**. This allows for a production-like setup with clean separation of web serving and PHP processing.

> 📁 The `docker-compose.yml` and `Dockerfile` for this setup are already present in this folder.

---

## 🧱 Architecture Overview

[[#🔍 Access the Web Server]]

[[#🐋 Step 1 Build & Launch Containers]]

[[#🔧 Step 2 Apache Configuration Notes]]

[[#📂 Directory Structure]]

---

## 📦 Setup Instructions

Ensure you are in the correct project directory:

```bash
cd /path/to/project_directory
```

This directory should contain:
`docker-compose.yml`

`/path/to/` folder (Dockerfile and config)

`/path/to/` folder (Dockerfile and app)

## 🐋 Step 1: Build & Launch Containers

Build and start your Apache + PHP FPM containers using:

```bash
docker compose up -d --build
```

This will:

- Build the PHP container
- Proxy requests from Apache to PHP-FPM via `fastcgi_pass`

## 🔧 Step 2: Apache Configuration Notes

Make sure the Apache Dockerfile or virtual host config includes:

```apache
<VirtualHost *:80>
    ServerName yourdomain.local

    DocumentRoot /var/www/html

    <FilesMatch \.php$>
        SetHandler "proxy:fcgi://php:9000"
    </FilesMatch>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

- `php` is the name of your PHP container as defined in `docker-compose.yml`
- Apache should have `proxy` and `proxy_fcgi` modules enabled (usually already done in Docker base image)

## 📂 Directory Structure

Your project folder may look like this:

```swift
</path/to/your-project>
├── docker-compose.yml
├── apache/
│   ├── Dockerfile
│   └── apache.conf
├── php/
│   ├── Dockerfile
│   └── index.php
```
## 🔍 Access the Web Server

Once the containers are up, access your site via:

`http://<raspberry-pi-ip>`

You should see the output from the `index.php` file served via PHP FPM and Apache.

## ✅ Outcome

- Apache is successfully reverse proxying requests to a PHP 7.4 FPM container
- You have a modular web stack running fully in Docker
- Your configuration can be easily reused across future apps or services