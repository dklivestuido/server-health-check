#!/bin/bash

echo "================================"
echo "      SERVER HEALTH CHECK"
echo "================================"

echo
echo "Hostname:"
hostname

echo
echo "Current User:"
whoami

echo
echo "System Uptime:"
uptime

echo
echo "Memory Usage:"
free -h

echo
echo "Disk Usage:"
df -h /

echo
echo "IP Address:"
hostname -I

echo
echo "Health Check Completed"
