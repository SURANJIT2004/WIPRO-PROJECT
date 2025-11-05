#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "Starting system maintenance..."

# --- 1. Update Package Lists ---
# Fetches the list of available updates from the repositories.
echo "Updating package lists..."
sudo apt update

# --- 2. Perform Upgrades ---
# Installs the newest versions of all packages currently installed.
# The '-y' flag automatically answers 'yes' to all prompts.
echo "Installing system updates..."
sudo apt upgrade -y

# --- 3. Autoremove Old Packages ---
# Removes packages (like old kernels) that were automatically installed
# to satisfy dependencies but are no longer needed.
echo "Removing old and unused packages..."
sudo apt autoremove -y

# --- 4. Clean Package Cache ---
# Clears out the local cache of retrieved package files.
# This frees up disk space, as the .deb files are no longer needed
# after installation.
echo "Cleaning up package cache..."
sudo apt clean

echo "System maintenance complete!"
