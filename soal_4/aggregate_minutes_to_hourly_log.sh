#!/bin/bash

# Path direktori untuk dilakukan monitor
TARGET_PATH="/home/$(whoami)/"

# command untuk mengecek ukuran directory target
DIRECTORY_SIZE=$(du -sh "$TARGET_PATH")

# Save informasi ukuran directory dalam file log sesuai format yang ada
LOG_FILE="metrics_$(date +"%Y%m%d%H%M%S").log"
echo "$(date +"%Y-%m-%d %H:%M:%S") Directory Size - $TARGET_PATH:
$DIRECTORY_SIZE" >> ~/$LOG_FILE
