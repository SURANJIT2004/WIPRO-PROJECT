#!/bin/bash

# --- Configuration ---
# Define the paths to your other scripts.
# If they are in the same directory, this is all you need.
BACKUP_SCRIPT="./backup.sh"
MAINTENANCE_SCRIPT="./maintenance.sh"
LOG_MONITOR_SCRIPT="./log_monitor.sh"

# --- Main Menu Loop ---
while true; do
    clear # Clear the screen for a clean menu
    echo "==================================="
    echo "  System Maintenance Suite Menu"
    echo "==================================="
    echo "1. Run System Backup"
    echo "2. Run System Maintenance (Update & Clean)"
    echo "3. Monitor System Logs (Check for 'Failed')"
    echo "4. Exit"
    echo "-----------------------------------"
    echo -n "Enter your choice [1-4]: "
    
    read choice

    # --- Handle User Choice ---
    case $choice in
        1)
            echo "Running backup script..."
            # Run the backup script
            $BACKUP_SCRIPT
            ;;
        2)
            echo "Running maintenance script (requires sudo)..."
            # Run the maintenance script with sudo
            sudo $MAINTENANCE_SCRIPT
            ;;
        3)
            echo "Running log monitor (requires sudo)..."
            # Run the log monitor script with sudo
            sudo $LOG_MONITOR_SCRIPT
            ;;
        4)
            echo "Exiting suite. Goodbye!"
            break # Exit the while loop
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 4."
            ;;
    esac

    echo ""
    echo "Press Enter to return to the menu..."
    read # Pause and wait for user to press Enter
done
