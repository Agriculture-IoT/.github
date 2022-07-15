#!/bin/bash

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1CE2AFD36DBCCA00

sudo echo "deb https://artifacts.chirpstack.io/packages/3.x/deb stable main" | sudo tee /etc/apt/sources.list.d/chirpstack.list

sudo DEBIAN_FRONTEND=noninteractive apt update -y 

sudo DEBIAN_FRONTEND=noninteractive apt install chirpstack-gateway-bridge -y 