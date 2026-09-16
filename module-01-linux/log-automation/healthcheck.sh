#!/bin/bash

# Set target log directory
LOG_DIR="./logs"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE="$LOG_DIR/system_health_$TIMESTAMP.log"

# Create log file with header
echo "==========================================" > "$LOG_FILE"
echo "System Health Snapshot - $TIMESTAMP" >> "$LOG_FILE"
echo "==========================================" >> "$LOG_FILE"

# Append Disk Usage
echo "" >> "$LOG_FILE"
echo "--- MEMORY USAGE ---" >> "$LOG_FILE"
free -h >> "$LOG_FILE"

# Log rotation: Delete log files older than 7 days
find "$LOG_DIR" -type f -name "system_health_*.log" -mtime +7 -exec rm {} \;

echo "Health check complete. Log written to $LOG_FILE"