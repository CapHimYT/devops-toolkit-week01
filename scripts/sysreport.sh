#!/usr/bin/env bash
set -euo pipefail
echo "=== System Health Report ==="
echo "Date: $(date)"
echo -e "\n--- Disk Usage ---"
df -h / | grep -v tmpfs
echo -e "\n--- Memory Usage ---"
free -m
echo -e "\n--- Top 3 CPU Processes ---"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 4
