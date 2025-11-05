#!/bin/bash
set -e # Exit immediately if a command fails

# --- Configuration ---
LOG_FILE="/var/log/auth.log"
KEYWORD="Failed"

# --- Error Handling ---
if [ ! -r "$LOG_FILE" ]; then
    echo "ERROR: Log file $LOG_FILE does not exist or is not readable."
    echo "Log monitor failed."
    exit 1 # Exit with a failure code
fi

# --- Script Body ---
echo "Starting log scan for '$KEYWORD' in $LOG_FILE..."
MATCHES=$(grep -i -n "$KEYWORD" "$LOG_FILE" || true)

if [ -n "$MATCHES" ]; then
    echo "----------------------------------------"
    echo "ALERT: Potential issues found!"
    echo "----------------------------------------"
    echo "$MATCHES"
else
    echo "Scan complete. No issues found."
fi
