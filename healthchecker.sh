#!/bin/bash
# --------------------------------------------------
# Service Health Check Script
# Author: Ahmmed Muhaz
# Description: Checks if critical services are
#              running and logs results with
#              timestamp to a log file
# Usage: bash healthchecker.sh
# --------------------------------------------------

# Ask user where to save the log file
# eg: /home/muhaz/logs or /var/log
read -p "Enter the destination to save the log file: " DEST

# Timestamp format: YYYY-MM-DD_HH-MM
# Used to track exactly when each check was performed
TIMESTAMP=$(date +%Y-%m-%d_%H-%M)

# ---- FUNCTION ----
# check_service() takes a service name as $1
# checks if its running using systemctl
# logs RUNNING or NOT RUNNING to healthcheck.log
check_service() {
    if systemctl is-active --quiet $1
    then
        echo "Checked on [$TIMESTAMP] $1 is RUNNING" >> "$DEST"/healthcheck.log
    else
        echo "Checked on [$TIMESTAMP] $1 is NOT RUNNING" >> "$DEST"/healthcheck.log
    fi
}

# ---- ADD OR REMOVE SERVICES AS NEEDED ----
# Add any service you want to monitor here!
# eg: check_service nginx
#     check_service mysql
#     check_service docker
check_service ssh
check_service apache2
check_service NetworkManager

echo "Health check done! Check $DEST/healthcheck.log"
