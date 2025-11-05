#!/bin/bash

# --- Configuration ---

# 1. What to back up. (Change this to a directory you want to back up)
SOURCE_DIR="/home/kali/Documents/WIPRO_PROJECT/Capstone_Project/Bash_Scripting"

# 2. Where to store the backups. (Change this to your backup location)
BACKUP_DIR="/home/kali/Documents/Backup/my_project"

# 3. The filename for the backup.
# We use 'date' to create a unique, timestamped filename.
FILENAME="backup_$(date +'%Y-%m-%d_%H-%M-%S').tar.gz"

# --- Script Body ---

# Create the backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Create the compressed tar archive
# -c : Create a new archive
# -z : Compress the archive with gzip
# -v : Verbose (show files as they are added)
# -f : Use archive file
echo "Starting backup of $SOURCE_DIR..."

tar -czvf "$BACKUP_DIR/$FILENAME" "$SOURCE_DIR"

echo "Backup complete!"
echo "File created: $BACKUP_DIR/$FILENAME"
