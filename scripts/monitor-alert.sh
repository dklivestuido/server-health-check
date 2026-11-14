
#!/bin/bash

echo "================================"
echo "     SERVER MONITORING ALERT"
echo "================================"

# Memory Usage
MEMORY=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')

echo
echo "Memory Usage: ${MEMORY}%"

if [ "$MEMORY" -ge 80 ]; then
    echo "WARNING: High Memory Usage!"
else
    echo "OK: Memory Usage Normal"
fi

# Root Disk Usage
DISK=$(df -P / | awk 'NR==2 {gsub("%","",$5); print $5}')

echo
echo "Disk Usage: ${DISK}%"

if [ "$DISK" -ge 80 ]; then
    echo "WARNING: High Disk Usage!"
else
    echo "OK: Disk Usage Normal"
fi

# CPU Load
LOAD=$(awk '{print $1}' /proc/loadavg)
CORES=$(nproc)

echo
echo "CPU Load: $LOAD"
echo "CPU Cores: $CORES"

if awk -v cpu_load="$LOAD" -v cores="$CORES" 'BEGIN {exit !(cpu_load > cores)}'; then
    echo "WARNING: High CPU Load!"
else
    echo "OK: CPU Load Normal"
fi

echo
echo "Monitoring Completed"

