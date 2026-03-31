#!/bin/bash
# -----------------------------------------------------
# Log Cleaner Script
# Author: Ahmmed Muhaz
# Description: Automatically deletes log files
#              older than specified days to free
#              up disk space on Linux servers
# Usage: bash logcleaner.sh
# -----------------------------------------------------

# Ask user which directory to clean
# eg: /var/log or /home/muhaz/logs
read -p "Enter the log directory: " LOGDIR

# Ask how old files should be before deleting
# eg: 7 = delete logs older than 7 days
#     30 = delete logs older than 30 days
read -p "Enter the days: " DAYS

echo "Cleaning logs older than $DAYS days...."

# find = search for files
# -name "*.log" = only .log files
# -mtime +$DAYS = older than specified days
# -exec rm {} \; = delete each file found
# sudo needed to delete system log files in /var/log
sudo find "$LOGDIR" -name "*.log" -mtime +$DAYS -exec rm {} \;

echo "Old Logs CLEANED!"
