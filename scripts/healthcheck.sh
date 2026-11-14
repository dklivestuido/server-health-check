#!/bin/bash

set -u

echo "========================================"
echo "         SERVER HEALTH CHECK"
echo "========================================"

echo
echo "[1] Hostname"
hostname

echo
echo "[2] Current User"
whoami

echo
echo "[3] System Uptime and Load"
uptime

echo
echo "[4] CPU Information"
nproc
echo "CPU cores available"

echo
echo "[5] Memory Usage"
free -h

echo
echo "[6] Root Disk Usage"
df -h /

echo
echo "[7] Top 5 Memory-Using Processes"
ps aux --sort=-%mem | head -6

echo
echo "[8] IP Address"
hostname -I

echo
echo "========================================"
echo "      HEALTH CHECK COMPLETED"
echo "========================================"
