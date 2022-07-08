#!/bin/bash

# Run this after reboot

#Force apt use ipv4
sudo bash -c 'printf "Acquire::ForceIPv4 \"true\";" > /etc/apt/apt.conf.d/99force-ipv4'

export DEBIAN_FRONTEND=noninteractive

sudo DEBIAN_FRONTEND=noninteractive apt update -y
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

sudo DEBIAN_FRONTEND=noninteractive apt install -y build-essential 
sudo DEBIAN_FRONTEND=noninteractive apt install -y python3 python3-pip
sudo DEBIAN_FRONTEND=noninteractive apt install -y cmake libudev-dev
sudo DEBIAN_FRONTEND=noninteractive apt install -y libusb-1.0-0-dev libffi-dev
sudo DEBIAN_FRONTEND=noninteractive apt install -y libssl-dev git
sudo DEBIAN_FRONTEND=noninteractive apt install -y minicom socat
sudo DEBIAN_FRONTEND=noninteractive apt install -y libqmi-utils udhcpc mtr gnutls-bin
sudo DEBIAN_FRONTEND=noninteractive apt install -y p7zip-full i2c-tools gpsd
sudo DEBIAN_FRONTEND=noninteractive apt install -y mlocate vim 
sudo DEBIAN_FRONTEND=noninteractive apt install -y docker
sudo DEBIAN_FRONTEND=noninteractive apt install -y docker-compose

sudo systemctl stop docker.service docker.socket
sudo usermod -aG docker pi

sudo systemctl start docker.service docker.socket
sudo systemctl enable docker.service docker.socket