# Installing vault on Raspberry Pi

#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Setting up Hashicorp vault 
sudo DEBIAN_FRONTEND=noninteractive  apt install -y software-properties-common

wget https://apt.releases.hashicorp.com/gpg

sudo gpg --no-default-keyring --keyring ./temp-keyring.gpg --import gpg 
sudo gpg --no-default-keyring --keyring ./temp-keyring.gpg --export --output hashicorp.gpg

sudo cp hashicorp.gpg /etc/apt/trusted.gpg.d/
sudo rm gpg temp-keyring.gpg* hashicorp.gpg

printf "deb [arch=arm64 signed-by=/etc/apt/trusted.gpg.d/hashicorp.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main"| sudo tee -a /etc/apt/sources.list.d/hashicorp.list

sudo DEBIAN_FRONTEND=noninteractive apt update -y 
sudo DEBIAN_FRONTEND=noninteractive  apt install -y vault
