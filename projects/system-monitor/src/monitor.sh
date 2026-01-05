#!/bin/bash

# Configuration
LOG_FILE="../system_health.log"
THRESHOLD=80

# Ensure log file exists
touch "$LOG_FILE"

echo "--- Monitoring Report: $(date) ---" >> "$LOG_FILE"

# 1. CPU Usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}' | cut -d. -f1)
echo "CPU Usage: $CPU_USAGE%" >> "$LOG_FILE"

# 2. Memory Usage
MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}' | cut -d. -f1)
echo "Memory Usage: $MEM_USAGE%" >> "$LOG_FILE"

# 3. Disk Usage (Root partition)
DISK_USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//')
echo "Disk Usage: $DISK_USAGE%" >> "$LOG_FILE"

# Logic for Alerts
if [ "$CPU_USAGE" -gt "$THRESHOLD" ] || [ "$MEM_USAGE" -gt "$THRESHOLD" ] || [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: Resource threshold exceeded!" >> "$LOG_FILE"
fi

echo "--------------------------------" >> "$LOG_FILE"
