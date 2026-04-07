#!/bin/bash

# Replace with your project directory
PROJECT_DIR="/home/u718327719/domains/pcsgroup.info/laravel-pcs"

# Move into the project directory
if [ -d "$PROJECT_DIR" ]; then
    cd "$PROJECT_DIR" || { echo "Failed to cd into $PROJECT_DIR"; exit 1; }
else
    echo "Project directory '$PROJECT_DIR' does not exist!"
    exit 1
fi

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Clearing caches..."

# Clear caches
php artisan config:clear || { echo "config:clear failed"; exit 1; }
php artisan route:clear  || { echo "route:clear failed"; exit 1; }
php artisan view:clear   || { echo "view:clear failed"; exit 1; }
php artisan cache:clear  || { echo "cache:clear failed"; exit 1; }

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Rebuilding caches..."

# Rebuild caches
php artisan config:cache || { echo "config:cache failed"; exit 1; }
php artisan route:cache  || { echo "route:cache failed"; exit 1; }

echo "[$(date '+%Y-%m-%d %H:%M:%S')] ✅ All caches cleared and rebuilt successfully!"
