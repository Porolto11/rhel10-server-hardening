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
