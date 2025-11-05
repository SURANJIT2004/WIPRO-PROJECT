#!/bin/bash

# --- Configuration ---

# 1. The log file to monitor.
#    (Requires 'sudo' or read permissions on this file)
LOG_FILE="/var/log/auth.log"

# 2. The keyword to search for (case-insensitive).
KEYWORD="Failed"

# --- Script Body ---

echo "Starting log scan for '$KEYWORD' in $LOG_FILE..."

# Use 'grep' to search for the keyword.
# -i : Case-insensitive search
# -n : Show line numbers (helpful for context)
# We use '|| true' to prevent the script from exiting if grep finds no matches
# (grep exits with an error code 1 when it finds nothing, which 'set -e' would catch)
MATCHES=$(grep -i -n "$KEYWORD" "$LOG_FILE" || true)

# Check if the $MATCHES variable is empty or not
if [ -n "$MATCHES" ]; then
    # If not empty, matches were found.
    echo "----------------------------------------"
    echo "ALERT: Potential issues found!"
    echo "----------------------------------------"
    echo "$MATCHES"
    echo "----------------------------------------"
    echo "Review the log file for details."
else
    # If it is empty, no matches were found.
    echo "Scan complete. No issues found."
fi
