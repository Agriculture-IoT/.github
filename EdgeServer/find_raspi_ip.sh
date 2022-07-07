#!/bin/bash

sudo nmap -sP $1 | awk '/^Nmap/{ip=$NF}/Raspberry/{print ip, "is the IP address of Raspberry Pi with MAC Address", $3}'
