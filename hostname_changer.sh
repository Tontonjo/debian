#!/bin/bash

# Tonton Jo - 2023
# Join me on Youtube: https://www.youtube.com/c/TontonJo

# This script aims to change the hosntame on a debian based host

# Version:
# V1.0 - Initial release

actual_hostname=$(hostname)

# set the new hostname
read -p "- enter new hostname (no space, special characters: only "-"allowed: " new_hostname

# Check hostname formatting
regex="^[a-zA-Z0-9][-a-zA-Z0-9]*$"
if [[ ! $new_hostname =~ $regex ]]; then
    echo "- Error - Invalid hostname"
    exit 1
fi

# Set new hostname
hostnamectl set-hostname "$new_hostname"
sudo sed -i "s/$actual_hostname/$new_hostname/g" /etc/hostname

read -p "- Do you want to reboot host now? y = yes / anything = no: " -n 1 -r
 if [[ $REPLY =~ ^[Yy]$ ]]; then
	reboot now
 fi
