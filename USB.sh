#!/bin/bash

# Script for mounting or unmounting a USB device from sda1
# If sda1 is NOT the destination your unit is most likely flashed wrong or has the wrong FW

# Device path
device_path="/dev/sda1"

# Where the USB Drive is mounted
mount_point="/mnt/usb"

# Get user input for whether to mount or unmounting. "choice" is the variable
read -p "Do you want to mount or unmount the USB? (m/um): " choice

# Mount the USB
if [[ $choice == 'm' ]]; then
	# Is it already mounted?
	if grep -qs "$mount_point" /proc/mounts; then
		echo "ERROR: The USB already mounted."
		exit 1
	fi
	
	# Create a mount point if it does not exit
	if [ ! -d "$mount_point" ]; then
		mkdir "$mount_point"
	fi
	
	# Mount the USB Device
	mount "$device_path" "$mount_point"
	
	# Did it mount correctly?
	if [ $? -eq 0 ]; then
		echo "USB device mounted successfully at $mount_point"
	else
		echo "ERROR: The USB failed to mount."
	fi
	
			
# Unmount the USB Device
elif [[ $choice == 'um' ]]; then
	# Is the USB unmounted?
    grep -qs $mount_point /proc/mounts
	if [ $? -eq 1 ]; then
		echo "Error: The USB device is not mounted."
		exit 1
	fi

	# unmount the USB
	umount "$mount_point"
		
	# Was the unmount successful?
	if [ $? -eq 0 ]; then
		echo "USB device unmounted successfully from $mount_point"
	else	
		echo "ERROR: The USB failed to unmount."
	fi
	
else
        echo "ERROR: Only support commands 'm' or 'um'"
fi

