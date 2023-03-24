#!/bin/bash

# Landon Walker
# This script will show you relevant information about your system at a quick glance

echo -e "-------------------------------System Information----------------------------"

echo -e "Hostname:\t\t"`hostname`

echo -e "Kernel:\t\t\t"`uname -r`

echo -e "Uptime:\t\t\t"`uptime | awk '{print $3,$4}' | sed 's/,//'`

echo -e "Manufacturer:\t\t"`cat /sys/class/dmi/id/chassis_vendor`

echo -e "Processor Name:\t\t"`awk -F':' '/^model name/ {print $2}' /proc/cpuinfo | uniq | sed -e 's/^[ \t]*//'`

echo -e "Architecture:\t\t"`arch`

echo -e "Active User:\t\t"`w | cut -d ' ' -f1 | grep -v USER | xargs -n1`

echo -e "System Main IP:\t\t"`hostname -I`

# uncomment if you want to see it
# echo -e "Linux Version: " `cat /proc/version`

echo ""

echo -e "---------------------------CPU Info-----------------------------"
lscpu | grep 'Model'
lscpu | grep 'Archit'
lscpu | grep 'CPU op'
lscpu | grep 'CPU MHz'
lscpu | grep 'Bogo'
lscpu | grep 'Byte Order'
lscpu | grep 'Address sizes'
lscpu | grep 'Vendor ID'
lscpu | grep 'CPU(s)'
lscpu | grep 'Threads(s)'
lscpu | grep 'Core(s)'
lscpu | grep 'Hyper'
lscpu | grep 'Virtualiz'

echo ""

echo -e "----------------------PCI/USB Devices-------------------------------"
echo "PCI Devices: "
lspci 
echo ""

echo "USB Devices: "
lsusb
echo ""

echo -e "-------------------RAM Usage--------------------"
free -m

echo ""

echo -e "-------------------------------Disk Usage >80%-------------------------------"
df -Ph | sed s/%//g | awk '{ if($5 > 80) print $0;}'
echo ""

# echo -e "TESTING"

