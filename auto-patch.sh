#!/bin/bash
echo "Updating system..."
sudo dnf update -y
echo "Checking security updates..."
sudo dnf updateinfo security
echo "Applying security patches..."
sudo dnf update --security -y
echo "Rebooting if needed..."
if [ -f /var/run/reboot-required ]; then sudo reboot; fi

#Auto-Patch Script
#I also added a crontab automation
#sudo crontab -e and added the line with the help of documentations: 0 3 * * 0 /full/path/auto-patch.sh >> /var/log/auto-patch.log 2>&1 then verified it with sudo crontab -l command
#this automation start on every sunday 3:00 AM and runs the script automatically and saves output for possible errors to the log file.
