#!/bin/bash

LOG_FILE="system.log"
USER_NAME=$(whoami)
TODAY=$(date)

if [ -z "$1" ]; then
    set -- all
fi

if [ "$1" = "all" ]; then
    echo "User: $USER_NAME" | tee -a "$LOG_FILE"
    echo "Date: $TODAY" | tee -a "$LOG_FILE"
    echo "===== SYSTEM INFO =====" | tee -a "$LOG_FILE"

    echo "" | tee -a "$LOG_FILE"
    echo "===== CPU =====" | tee -a "$LOG_FILE"
    lscpu | grep "Model name" | tee -a "$LOG_FILE"

    echo "" | tee -a "$LOG_FILE"
    echo "===== MEMORY =====" | tee -a "$LOG_FILE"
    free -h | tee -a "$LOG_FILE"

    echo "" | tee -a "$LOG_FILE"
    echo "===== DISK =====" | tee -a "$LOG_FILE"
    df -h | grep "^/dev" | tee -a "$LOG_FILE"

elif [ "$1" = "cpu" ]; then
    echo "[$(date)] ===== CPU =====" | tee -a "$LOG_FILE"
    echo "[$(date)] $(lscpu | grep 'Model name')" | tee -a "$LOG_FILE"

elif [ "$1" = "memory" ]; then
    echo "===== MEMORY =====" | tee -a "$LOG_FILE"
    free -h | tee -a "$LOG_FILE"

elif [ "$1" = "disk" ]; then
    echo "[$(date)] ===== DISK =====" | tee -a "$LOG_FILE"
    df -h | grep "^/dev" | tee -a "$LOG_FILE"

    DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
    echo "[$(date)] Disk usage is ${DISK_USAGE}%" | tee -a "$LOG_FILE"

    if [ "$DISK_USAGE" -ge 80 ]; then
        echo "[$(date)] WARNING: Disk usage is above 80%" | tee -a "$LOG_FILE"
    else
        echo "[$(date)] Disk usage is OK" | tee -a "$LOG_FILE"
    fi

else
    echo "Usage:"
    echo "./system-info.sh all"
    echo "./system-info.sh cpu"
    echo "./system-info.sh memory"
    echo "./system-info.sh disk"
fi
