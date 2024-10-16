#!/bin/bash

# Variables
BACKUP_DIR="/var/lib/postgresql/backup"
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="$BACKUP_DIR/axelor_backup_$TIMESTAMP.tar.gz"

# Create the backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Create a base backup using pg_basebackup
pg_basebackup -U axelor -D "$BACKUP_FILE" -Ft -z -P

# Remove backups older than 7 days
find "$BACKUP_DIR" -name "*.tar.gz" -type f -mtime +7 -exec rm {} \;
