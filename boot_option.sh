#!/bin/bash

sudo -v

# Define the file to be edited
FILE="/boot/efi/loader/entries/Pop_OS-current.conf"

# Define the backup file name
BACKUP_FILE="${FILE}.bak"

# Check if the file exists
if ! sudo test -f "$FILE"; then
    echo "Error: File $FILE does not exist."
    exit 1
fi

# Check if the replacement text already exists in the file
if sudo grep -q "ro loglevel=0 systemd.show_status=true" "$FILE"; then
    echo "The file already contains the desired text. No changes made."
    exit 0
fi

# Create a backup of the file
sudo cp "$FILE" "$BACKUP_FILE"
echo "Backup created at $BACKUP_FILE"

# Replace the specified text
sudo sed -i 's/ro quiet loglevel=0 systemd.show_status=false splash/ro loglevel=0 systemd.show_status=true/' "$FILE"

# Verify the replacement
if sudo grep -q "ro loglevel=0 systemd.show_status=true" "$FILE"; then
    echo "Replacement successful!"
else
    echo "Replacement failed. Please check the file manually."
fi
