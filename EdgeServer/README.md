# Setting up Edge server with RaspberryPi 4B (8GB Ram)

This document covers steps to install RaspberryPi Lite OS (64bit) using Raspberry foundation provided software tools.  

## Installing Headless OS
1. Install and launch latest version of [RaspberryPi Imager](https://www.raspberrypi.com/software/)  
   ![RaspberryPi Imager](../images/RaspberryPi/Raspberry%20Pi%20Imager.png)

2. Select the latest version of RaspberryPi OS lite (64bit).
    > Release date: April 4th 2022  
    > System: 64-bit  
    > Kernel version: 5.15  
    > Debian version: 11 (bullseye)  

    ![Raspibian OS Lite (64bit)](../images/RaspberryPi/Select_RaspberryPi_OS_Lite.png)

3. Connect Micro SD card reader with 32GB (or larger) micro SD card, to your computer.

4. Select storage as the micro SD in RaspberryPi Imager.  
   ![Choose storage](../images/RaspberryPi/Choose%20Storage.png)  

5. Click on the gear icon to configure the Advanced Options.  
   ![Advanced options](../images/RaspberryPi/Advanced%20options.png)  
    > Remember to set ***Username***, ***Password***, ***SSID with password***, ***Wireless LAN country***, and ***Locate settings*** (Timezone).

   ![Username & Password](../images/RaspberryPi/set_username_password.png)

   ![LAN and Locate](../images/RaspberryPi/Wireless%20LAN%20and%20Timezone.png)  
   
6. Verify all the options selected and click on ***Write*** button.  
   ![Write](../images/RaspberryPi/Write.png)
    > Select ***yes*** to continue and follow the steps to complete OS installation.  

   ![Writing](../images/RaspberryPi/Writing.png)
    
7. Eject the Micro SD card and insert into SD card slot of the RaspberryPi.

8. Setup RaspberryPi board as documented in the **[Getting started](https://www.raspberrypi.com/documentation/computers/getting-started.html#installing-the-operating-system)** document. This RaspberryPi documentation also includes a video and description of network OS installation. 

---

## First Boot

First boot may take more than 5-10mins to complete. 


> If a monitor is connected, the first boot output will be as below:
>> <details>
>> <summary> Click to expand</summary>
>> 
>> Starting Load/Save RF Kill Switch Status...   
>> Started Network Tine Synchronization.  
>> [ OK ] Reached target System Initialization.  
>> [ OK ] Started Daily Cleanup of Temporary Directories.  
>> [ OK ] Reached target System Time Set.  
>> [ OK ] Reached target System Time Synchronized.  
>> [ OK ] Started Daily apt download activities.  
>> [ OK ] Started Daily apt upgrade and clean activities.  
>> [ OK ] Started Periodic ext4 Online data Check for A11 Filesystems.  
>> [ OK ] Started Discard unused blocks once a week.  
>> [ OK ] Started Daily rotation of log files.  
>> [ OK ] Started Daily man-db regeneration.  
>> [ OK ] Reached target Timers.  
>> [ OK ] Listening on Avahi mDNS/DNS-SD Stack Activation Socket.  
>> [ OK ] Listening on D-Bus System Message Bus Socket.  
>> [ OK ] Listening on triggerhappy.socket.  
>> [ OK ] Reached target Sockets.  
>> [ OK ] Reached target Basic System.  
>>        Starting Save/Restore Sound Card State...  
>>        Starting Avahi mDNS/DNS-SD Stack...   
>> [ OK ] Started Regular background program processing daemon.  
>> [ OK ] Started D-Bus System Message Bus.  
>>        Starting dphys-swapfile-init, and delete a swap file...  
>>        Starting Remove Stale Online Metadata Check Snapshots...  
>>        Starting Configure Bluetooth Modems connected by UART...  
>>        Starting LSB: Switch to ondemand cpu governor (unless shift key is pressed)...  
>>        Starting Regenerate SSH host keys...  
>>        Starting LSB: Resize the root filesystem to fill partition...  
>>        Starting LSB: rng-tools (Debian variant)....   
>>        Starting Check for RaspberryPi EEPROM updates...  
>>        Starting System Logging Service...  
>>        Starting User Login Management...  
>>        Starting triggerhappy global hotkey daemon...  
>>        Starting WPA supplicant...  
>> [ OK ] Started Load Save RF Kill Switch Status.  
>> [ OK ] Started System Logging Service.  
>> [ OK ] Started triggerhappy global hotkey daemon.  
>> [ OK ] Finished Save/Restore Sound Card State.  
>> [ OK ] Finished Remove Stale Online ext4 Metadata Check Snapshots.  
>> [ OK ] Started Avahi mDNS/DNS-SD Stack.  
>> [ OK ] Started WPA supplicant.  
>> [ OK ] Started User Login Management.  
>> [ OK ] Reached target Network.  
>> [ OK ] Reached target Sound Card.  
>>        Starting DHCP Client Daemon...  
>>        Starting /etc/rc.local Compatibility...  
>>        Starting Permit User Sessions...   
>> [ OK ] Finished Set console font and keymap.  
>> [ OK ] Started Configure Bluetooth Modems connected by UART.  
>> [ OK ] Started LSB: Switch to ondemand cpu governor (unless shift key is pressed).  
>> [ OK ] Started LSB: rng-tools (Debian variant).  
>> [ OK ] Finished Check for RaspberryPi EEPROM updates.  
>> [ OK ] Finished dphys-swapfile- set up, mount/unmount, and delete a swap file.  
>> [ OK ] Finished Regenerate SSH host keys.  
>> [ OK ] Started /etc/rc.local Compatibility.  
>> [ OK ] Finished Permit User Sessions.  
>> [ OK ] Created slice system-bthelper.slice.  
>>        Starting RaspberryPi bluetooth helper...  
>> [ OK ] Started Getty on tty1.  
>> [ OK ] Reached target Login Prompts.  
>>        Starting OpenBSD Secure Shell server...  
>>        Starting Load Save RF Kill Switch Status...  
>> [ OK ] Started Load/Save RF Kill Switch Status.  
>> [ OK ] Finished RaspberryPi bluetooth helper.  
>>        Starting Bluetooth service...  
>> [ OK ] Started OpenBSD Secure Shell server.  
>>   
>> Debian GNU/Linux 11 edgeserver01 tty1  
>>  
>> edgeserver01 login: pi (automatic login)  
>> 
>> Linux edgeserver01 5.15.32-u8 #1538 SMP PREEMPT Thu Mar 31 19:40:39 BST 20ZZ aarch64  
>>
>> The programs included with the Debian GNU/Linux system are free software: the exact distribution terms for each program are described in the  
>>
>> individual files in /usr/share/doc/-/copyright.  
>>
>> Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent  
>> permitted by applicable law.  
>> Last login: Mon Apr 4 07:41:54 PDT 2022 on top  
>> pi@edgeserver01:~ $   
>> </details>
  
  
Run **'sudo nmap -sP < network subnet >'** command to detect the IP address and Mac address of the RaspberryPi Wireless adaptor.  

```
sudo nmap -sP '192.168.0.0/24' | awk '/^Nmap/{ip=$NF}/Raspberry/{print ip, "is the IP address of RaspberryPi with MAC Address", $3}'
[sudo] password for atul:
192.168.0.247 is the IP address of RaspberryPi with MAC Address DC:A6:32:C5:AB:BB
```

SSH to RaspberryPi using the Username and Password set in the Advanced options in previous section.
In this example username 'pi' was created. [Read more](https://www.raspberrypi.com/news/raspberry-pi-bullseye-update-april-2022/) about recent security updates to Bullseye OS, where default username (**pi**) and password (**raspberry**) is now disabled. 


```
ssh pi@192.168.0.247
Warning: Permanently added '192.168.0.247' (ECDSA) to the list of known hosts.
pi@192.168.0.247's password: 
Linux edgeserver01 5.15.32-v8+ #1538 SMP PREEMPT Thu Mar 31 19:40:39 BST 2022 aarch64

The programs included with the Debian GNU/Linux system are free software;  
the exact distribution terms for each program are described in the  
individual files in /usr/share/doc/*/copyright.  
 
Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent  
permitted by applicable law.  
Last login: Wed Jul  6 00:22:40 2022  
```

RaspberryPi Lite OS (64bit) is a debian based OS and comes with **apt** package manager. 
