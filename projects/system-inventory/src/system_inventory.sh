#!/bin/bash

# --- Configuration ---
OUTPUT_DIR="/home/adel/linux-system-portfolio/projects/system-inventory/reports"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
OUTPUT_FILE="$OUTPUT_DIR/inventory_$TIMESTAMP.json"

# Ensure output directory exists
mkdir -p "$OUTPUT_DIR"

# --- Defensive Checks ---
CMD_CURL=$(command -v curl)

# --- Data Collection ---
KERNEL=$(uname -r)
OS_DISTRO=$(cat /etc/os-release | grep "^PRETTY_NAME" | cut -d= -f2 | tr -d '"')
CPU_MODEL=$(grep "model name" /proc/cpuinfo | head -n1 | cut -d: -f2 | x86_64 sed 's/^[ \t]*//')
TOTAL_RAM=$(free -h | grep Mem | awk '{print $2}')
DISK_USAGE=$(df -h / | grep / | awk '{print $5}')
LOCAL_IP=$(hostname -I | awk '{print $1}')

# Public IP with defensive fallback
if [ -n "$CMD_CURL" ]; then
    PUBLIC_IP=$(curl -s https://ifconfig.me || echo "Lookup Failed")
else
    PUBLIC_IP="curl not installed"
fi

LOGGED_USERS=$(who | awk '{print $1}' | sort -u | tr '\n' ',' | sed 's/,$//')

# --- Generate JSON Payload ---
cat <<EOF > "$OUTPUT_FILE"
{
  "timestamp": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")",
  "system": {
    "kernel": "$KERNEL",
    "os_distro": "$OS_DISTRO",
    "cpu": "$CPU_MODEL"
  },
  "resources": {
    "total_ram": "$TOTAL_RAM",
    "disk_usage_root": "$DISK_USAGE"
  },
  "network": {
    "local_ip": "$LOCAL_IP",
    "public_ip": "$PUBLIC_IP"
  },
  "users": {
    "current_logins": "$LOGGED_USERS"
  }
}
EOF

echo "System Inventory Report generated: $OUTPUT_FILE"
