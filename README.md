# WIPRO-PROJECT
Bash System Maintenance Suite
A simple, menu-driven suite of Bash scripts for performing common Linux system administration tasks, including automated backups, system updates, and log monitoring.

## Features:

1. Menu-Driven Interface: A clean, easy-to-use menu (`main.sh`) to access all functions.

2. Automated Backups: Creates timestamped, compressed `.tar.gz` archives of a specified directory (`backup.sh`).

3. System Maintenance: Uses apt to update package lists, install upgrades, remove old dependencies, and clear the package cache (`maintenance.sh`).

4. Log Monitoring: Scans a specified log file (e.g., `/var/log/auth.log`) for specific error keywords like "Failed" (`log_monitor.sh`).

5. Centralized Logging: All actions performed through the menu are logged with timestamps to a central `maintenance_suite.log` file for easy review.

6. Error Handling: Includes basic checks to ensure scripts fail gracefully (e.g., checking if a source directory exists).

## Requirements:

1. A Debian-based Linux distribution (e.g., Ubuntu, Debian, Linux Mint) that uses the `apt` package manager.

2. Bash (the shell to run the scripts).

3. `tar` and `gzip` for the backup script.

4. `sudo` privileges are required for the maintenance and log monitoring scripts.

## Installation and Setup:
1. Clone the repository:
```
git clone https://github.com/your-username/your-repo-name.git

cd your-repo-name
```
2. Make all scripts executable:
```
chmod +x *.sh
```
3. Configure the Scripts (Important!):Before running, you must edit the configuration variables at the top of the scripts to match your system.

  **backup.sh:**

      SOURCE_DIR: The directory you want to back up (e.g.,/home/username/documents).

      BACKUP_DIR: The directory where you want to store the backups (e.g.,/mnt/backups).                                      

  **log_monitor.sh:**

      LOG_FILE: The log file you want to monitor (e.g.,/var/log/auth.log).

      KEYWORD: The term you want to search for (e.g., "Failed").

  ## Usage:
  To start the suite, simply run the main script from your terminal:
  ```
./main.sh
```

This will launch the interactive menu. Follow the on-screen prompts to select an option.

    1.  Options 2 (Maintenance) and 3 (Log Monitor) will prompt you for your sudo password as they require administrator privileges.

    2. All output will be displayed on the screen and saved to maintenance_suite.log.

## Script Details:
1. ```main.sh```: The main executable. This script provides the user menu, handles user input, and calls the other scripts while logging their output.

2. ```backup.sh```: A standalone script that creates a compressed tarball of a specified directory.

3. ```maintenance.sh```: A script that runs the ```apt update```, ```apt upgrade -y```, ```apt autoremove -y```,and ```apt clean``` commands in sequence.

4. ```log_monitor.sh```: A script that uses ```grep``` to scan a log file for a specific keyword and alerts the user if any matches are found.

5. ```maintenance_suite.log```: This file is created by ```main.sh``` on its first run. It stores the output of all tasks for later review.



## NOTES:
  **Here some extra .sh file is there. It ie there to add error handling and logging functionalities in the .sh code**
