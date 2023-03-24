#!/bin/bash

# Reads are from the eMMC to the external USB
# so go from internal media folder to mnt

# This script is for copying frmo the eMMC to an external drive to activates READS

# Set the source and destination directories
# Source will be media
source_dir="/home/landon/"
# Dest will be external drive
dest_dir="/home/landon/TEST"

# Set the filename
filename="names.txt"

# Check if the source file exists
if [ -f "$source_dir/$filename" ]; then
    # Transfer the file to the destination directory
    cp "$source_dir/$filename" "$dest_dir/$filename"

    # Wait for the file to finish transferring, 1 for 1 sec
    echo "File transfer started. Waiting for 1 seconds to ensure file transfer completion."
    sleep 1

    # Check if the file was transferred successfully
    if [ -f "$dest_dir/$filename" ]; then
        echo "File transfer successful."
		# Note to not bog down the system we have the rm command to delete the file after trasnferring
		rm "$dest_dir/$filename"
    else
        echo "Error: The file transfer failed."
    fi
else
    echo "Error: The source file does not exist."
fi