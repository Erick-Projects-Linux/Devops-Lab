#!/bin/bash

LOG_FILE="system.log"
USER_NAME=$(whoami)
MEM_USAGE=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 * 100}')
DISK_USAGE=$(df /workspaces | awk 'NR==2 {print $5}' | tr -d '%')
CPU_DATA=$(top -bn1 | grep "%Cpu")
CPU_USAGE=$(echo "$CPU_DATA" | awk '{print int(100 - $8)}')
MEM_THRESHOLD=80
DISK_THRESHOLD=80
CPU_THRESHOLD=80

check_threshold() {
    local usage=$1
    local threshold=$2
    local metric=$3

    if [ "$usage" -ge "$threshold" ]; then
        echo "[$(date)] WARNING: ${metric} usage is above ${threshold}%" | tee -a "$LOG_FILE"
    else
        echo "[$(date)] ${metric} usage is OK" | tee -a "$LOG_FILE"
    fi
}

blank_line() {
    echo | tee -a "$LOG_FILE"
}

if [ -z "$1" ]; then
    set -- all
fi

if [ "$1" = "all" ]; then
    echo "[$(date)] User: $USER_NAME" | tee -a "$LOG_FILE"
    echo "[$(date)] ===== SYSTEM INFO =====" | tee -a "$LOG_FILE"

    blank_line
    echo "===== CPU =====" | tee -a "$LOG_FILE"
    echo "$CPU_DATA" | tee -a "$LOG_FILE"
    echo "[$(date)] CPU usage is ${CPU_USAGE}%" | tee -a "$LOG_FILE"
    check_threshold "$CPU_USAGE" "$CPU_THRESHOLD" "CPU"

    blank_line
    echo "===== MEMORY =====" | tee -a "$LOG_FILE"
    free -h | tee -a "$LOG_FILE"
    echo "[$(date)] Memory usage is ${MEM_USAGE}%" | tee -a "$LOG_FILE"
    check_threshold "$MEM_USAGE" "$MEM_THRESHOLD" "Memory"

    blank_line
    echo "===== DISK =====" | tee -a "$LOG_FILE"
    df -h /workspaces | tee -a "$LOG_FILE"
    echo "[$(date)] Disk usage is ${DISK_USAGE}%" | tee -a "$LOG_FILE"
    check_threshold "$DISK_USAGE" "$DISK_THRESHOLD" "Disk"

elif [ "$1" = "cpu" ]; then
    echo "[$(date)] ===== CPU =====" | tee -a "$LOG_FILE"
    echo "$CPU_DATA" | tee -a "$LOG_FILE"
    echo "[$(date)] CPU usage is ${CPU_USAGE}%" | tee -a "$LOG_FILE"
    check_threshold "$CPU_USAGE" "$CPU_THRESHOLD" "CPU"

elif [ "$1" = "memory" ]; then
    echo "[$(date)] ===== MEMORY =====" | tee -a "$LOG_FILE"
    free -h | tee -a "$LOG_FILE"
    echo "[$(date)] Memory usage is ${MEM_USAGE}%" | tee -a "$LOG_FILE"
    check_threshold "$MEM_USAGE" "$MEM_THRESHOLD" "Memory"

elif [ "$1" = "disk" ]; then
    echo "[$(date)] ===== DISK =====" | tee -a "$LOG_FILE"
    df -h /workspaces | tee -a "$LOG_FILE"
    echo "[$(date)] Disk usage is ${DISK_USAGE}%" | tee -a "$LOG_FILE"

    check_threshold "$DISK_USAGE" "$DISK_THRESHOLD" "Disk"
elif [ "$1" = "monitor" ]; then
    echo "Starting monitoring... Press CTRL+C to stop"

    while true; do
        ./system-info.sh all
        sleep 5
    done

else
    echo "Usage:"
    echo "./system-info.sh all"
    echo "./system-info.sh cpu"
    echo "./system-info.sh memory"
    echo "./system-info.sh disk"
fi
