#!/bin/bash
set -e # Exit immediately if a command fails

# --- Configuration ---
SOURCE_DIR="/home/kali/Documents/WIPRO_PROJECT/Capstone_Project/Bash_Scripting"
BACKUP_DIR="/home/kali/Documents/Backup/my_project"
FILENAME="backup_$(date +'%Y-%m-%d_%H-%M-%S').tar.gz"

# --- Error Handling ---
if [ ! -d "$SOURCE_DIR" ]; then
    echo "ERROR: Source directory $SOURCE_DIR does not exist."
    echo "Backup failed."
    exit 1 # Exit with a failure code
fi

# --- Script Body ---
mkdir -p "$BACKUP_DIR"
echo "Starting backup of $SOURCE_DIR..."
tar -czvf "$BACKUP_DIR/$FILENAME" "$SOURCE_DIR"
echo "Backup complete! File created: $BACKUP_DIR/$FILENAME"

