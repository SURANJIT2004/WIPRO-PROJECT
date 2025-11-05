#!/bin/bash

# --- Configuration ---
BACKUP_SCRIPT="./backup_1.sh"
MAINTENANCE_SCRIPT="./maintenance.sh"
LOG_MONITOR_SCRIPT="./log_monitor_1.sh"

# 1. Define a central log file for the suite
LOG_FILE="maintenance_suite.log"

# Function to add a timestamped entry to the log
log_action() {
    echo "================ $(date) ================" >> "$LOG_FILE"
    echo "Running: $1" >> "$LOG_FILE"
    echo "-------------------------------------------------" >> "$LOG_FILE"
}

# --- Main Menu Loop ---
while true; do
    clear
    echo "==================================="
    echo "  System Maintenance Suite Menu"
    echo "==================================="
    echo "1. Run System Backup"
    echo "2. Run System Maintenance (Update & Clean)"
    echo "3. Monitor System Logs (Check for 'Failed')"
    echo "4. Exit"
    echo "-----------------------------------"
    echo " (Logs are saved to $LOG_FILE)"
    echo -n "Enter your choice [1-4]: "
    
    read choice

    # --- Handle User Choice ---
    case $choice in
        1)
            echo "Running backup script..."
            log_action "Backup Script"
            # Pipe all output (stdout & stderr) to 'tee'
            # -a : appends to the log file instead of overwriting
            $BACKUP_SCRIPT 2>&1 | tee -a "$LOG_FILE"
            ;;
        2)
            echo "Running maintenance script (requires sudo)..."
            log_action "Maintenance Script"
            sudo $MAINTENANCE_SCRIPT 2>&1 | tee -a "$LOG_FILE"
            ;;
        3)
            echo "Running log monitor (requires sudo)..."
            log_action "Log Monitor Script"
            sudo $LOG_MONITOR_SCRIPT 2>&1 | tee -a "$LOG_FILE"
            ;;
        4)
            echo "Exiting suite. Goodbye!"
            break
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 4."
            ;;
    esac

    echo ""
    echo "Press Enter to return to the menu..."
    read
done
