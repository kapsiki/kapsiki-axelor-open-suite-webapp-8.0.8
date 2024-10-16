#!/bin/bash

# Variables
DATA_DIR="/var/lib/postgresql/data"
BACKUP_DIR="/var/lib/postgresql/backup"

# Step 1: Stop PostgreSQL Service
echo "Stopping PostgreSQL service..."
docker-compose -f prod.docker-compose.yml down

# Step 2: Restore the Base Backup
echo "Restoring base backup from $BACKUP_DIR..."
rm -rf $DATA_DIR/*
tar -xzf "$BACKUP_DIR/$(ls -t $BACKUP_DIR/*.tar.gz | head -n 1)" -C $DATA_DIR

# Step 3: Start PostgreSQL Service
echo "Starting PostgreSQL service..."
docker-compose -f prod.docker-compose.yml up -d

# Step 4: Monitor Recovery
echo "Monitoring PostgreSQL recovery process..."
sleep 5  # Wait for a few seconds for the service to start
docker logs db  # Check logs to verify recovery process

echo "Recovery process initiated. Check logs for details."
