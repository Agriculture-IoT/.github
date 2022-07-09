#!/bin/bash

# Method 1:
dig -p 5353  @224.0.0.251 +short edgeserver01.local

# Method 2:
sudo nmap -sP $1 | awk '/^Nmap/{ip=$NF}/Raspberry/{print ip, "is the IP address of Raspberry Pi with MAC Address", $3}'
