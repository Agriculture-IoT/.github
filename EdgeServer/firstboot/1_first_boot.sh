#!/bin/bash

# Run this script after first boot configuration

printf "###############

interface wlan0
metric 0

interface wwan0
metric 0

###############"| sudo tee -a /etc/dhcpcd.conf

sudo sed -i '/exit\ 0/i \
iw wlan0 set power_save off \
iw dev wlan0 set power_save off \
export MTP_NO_PROBE="1" \
' /etc/rc.local

sudo systemctl stop bluetooth.service bluetooth.target
sudo systemctl disable bluetooth.service

sudo reboot