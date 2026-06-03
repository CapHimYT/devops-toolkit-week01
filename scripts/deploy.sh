#!/usr/bin/env bash
set -euo pipefail

echo "🚀 Starting Production Deployment (Build 2)..."
git pull origin main || true

echo ">>> [1/3] Deploying Python Web App (Systemd)..."
sudo cp systemd/myapp.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now myapp.service
sudo systemctl restart myapp.service

echo ">>> [2/3] Deploying Nginx Reverse Proxy..."
sudo cp nginx/default.conf /etc/nginx/sites-available/default
sudo ln -sf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
sudo nginx -t
sudo systemctl reload nginx

echo ">>> [3/3] Deploying System Health Timer..."
sudo cp systemd/sysreport.* /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now sysreport.timer

echo "✅ Deployment Successful! Real backend is live."
