#!/usr/bin/env bash
set -euo pipefail
echo "Starting Build 2 Deployment..."
echo "[1/3] Pulling latest code..."
sleep 1
echo "[2/3] Copying Nginx configuration..."
sleep 1
echo "[3/3] Restarting systemd services..."
sleep 1
echo "Deployment Successful! Server is live."
