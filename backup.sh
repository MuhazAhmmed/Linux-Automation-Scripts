#!/bin/bash

# -------------------------------------------------------------------------
# Auto Backup Script with Timestamp
# Author: Ahmmed Muhaz
# Description: Backs up any directory with timestamp to prevent overwrites
# Usage: bash backup.sh 
# -------------------------------------------------------------------------

read -p "Enter the source directory: " SRC

# Timestamp format: YYYY-MM-DD_HH-MM
# Creates unique folder name for every backup run
TIMESTAMP=$(date +%Y-%m-%d_%H-%M)

# Change this to your preferred backup destination!
# eg: /home/youruser/backups or /mnt/data/backups
DEST="/home/muhaz/backups/backup_$TIMESTAMP"

# sudo needed to create folders in system directories
# if backing up to your own home folder - sudo not needed!
sudo mkdir -p "$DEST"

# Change muhaz:muhaz to your own user:group!
# eg: john:john or ubuntu:ubuntu
# needed so your user can write to the folder after sudo mkdir
sudo chown muhaz:muhaz "$DEST"

if cp -r "$SRC" "$DEST"
then
    echo "Backup Created at: $DEST"
else
    echo "Backup FAILED"
    exit 1
fi
