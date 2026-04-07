#!/bin/bash

# Absolute path to your project // REPLACE WITH YOUR OWN
DEPLOY_DIR="/home/u718327719/domains/pcsgroup.info/laravel-pcs"
LOG_FILE="/home/u718327719/domains/pcsgroup.info/auto_deploy.log"
RESET_FILE="/home/u718327719/domains/pcsgroup.info/laravel-cache.sh"
BRANCH="master"

echo "===== New cron run $(date '+%Y-%m-%d %H:%M:%S') =====" >> "$LOG_FILE"
cd "$DEPLOY_DIR" || { 
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ERROR: Cannot access $DEPLOY_DIR" >> "$LOG_FILE"
    exit 1
}

git fetch origin "$BRANCH" >> "$LOG_FILE" 2>&1

# Get local and remote commit hashes
LOCAL_HASH=$(git rev-parse HEAD)
REMOTE_HASH=$(git rev-parse origin/"$BRANCH")

# Compare and pull if needed
if [ "$LOCAL_HASH" != "$REMOTE_HASH" ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - New changes detected. Pulling..." >> "$LOG_FILE"
    git pull origin "$BRANCH" >> "$LOG_FILE" 2>&1
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Pull complete." >> "$LOG_FILE"
    bash "$RESET_FILE" >> "$LOG_FILE" 2>&1
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - No changes detected." >> "$LOG_FILE"
fi

echo "" >> "$LOG_FILE"