#!/bin/bash

# Run this after reboot

#Force apt use ipv4
sudo bash -c 'printf "Acquire::ForceIPv4 \"true\";" > /etc/apt/apt.conf.d/99force-ipv4'

export DEBIAN_FRONTEND=noninteractive

sudo DEBIAN_FRONTEND=noninteractive apt update -y
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y


sudo DEBIAN_FRONTEND=noninteractive apt install -y build-essential python3 \
python3-pip cmake libudev-dev \
libusb-1.0-0-dev libffi-dev \
libssl-dev git
sudo DEBIAN_FRONTEND=noninteractive apt install -y minicom socat
sudo DEBIAN_FRONTEND=noninteractive apt install -y libqmi-utils udhcpc mtr gnutls-bin
sudo DEBIAN_FRONTEND=noninteractive apt install -y p7zip-full i2c-tools gpsd
sudo DEBIAN_FRONTEND=noninteractive apt install -y mlocate vim 
sudo DEBIAN_FRONTEND=noninteractive apt install -y docker
sudo DEBIAN_FRONTEND=noninteractive apt install -y docker-compose

sudo systemctl stop docker.service docker.socket

sudo usermod -aG docker pi

sudo systemctl start docker
sudo systemctl enable docker