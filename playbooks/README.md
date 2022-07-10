# Automate RaspberryPi firstboot setup

**Step 1.** Create new ssh-key pair

```
ssh-keygen -t rsa -b 2048 -f ~/.ssh/pi_key
```
<pre>
<details>  
<summary>ssh-keygen output</summary>
Generating public/private rsa key pair.  
Enter passphrase (empty for no passphrase):  
Enter same passphrase again:   
Your identification has been saved in pi_key  
Your public key has been saved in pi_key.pub  
The key fingerprint is:  
SHA256:jKtSGdXXZUsxXmbkdmPO0XguwleMxANdeVIO3RRmU+I atul@eklavya  
The key's randomart image is:  
+---[RSA 2048]----+  
|       .   ..=X%#|  
|      . . . .*B/*|  
|     .   .    E*@|  
|    .  o   .  +=+|   
|     o. S   o oo.|  
|    o  .     o . |  
|   .  .          |  
|  .  .           |  
|   ..            |  
+----[SHA256]-----+  
</details></pre>

**Step 2.** Update the Advanced options in *RaspberryPi Imager*. 

Enable **Allow public-key authentication only** option in **Enable SSH** section with the new public key (~/.ssh/pi_key.pub)

![Enable SSH in Advanced options](../images/RaspberryPi/ssh_with_key_only.png)

> Update the edgeserver.yml file lines 6 and 7 if any of the username or ssh-key filename or ssh-key path is different.

**Step 3.** Install ansible on local machine and run the playbook

```  
ansible-playbook edgeserver.yml -i edgeserver01.local,    
```

<pre>
<details>  
<summary>Playbook output</summary>  
  
PLAY [First boot actions] *******************************************************************************************************************************************************************  
  
TASK [Ping host] ****************************************************************************************************************************************************************************  
ok: [edgeserver01.local]  
  
TASK [Update /etc/dhcpcd.conf] **************************************************************************************************************************************************************  
changed: [edgeserver01.local]  
  
TASK [Disable WiFi power_save] **************************************************************************************************************************************************************  
changed: [edgeserver01.local]  
  
TASK [Update /etc/apt/apt.conf.d/99force-ipv4] **********************************************************************************************************************************************  
changed: [edgeserver01.local]  
  
TASK [Disable bluetooth service] ************************************************************************************************************************************************************  
changed: [edgeserver01.local] => (item=bluetooth.service)  
changed: [edgeserver01.local] => (item=bluetooth.target)  
  
TASK [Disable console autologin] ************************************************************************************************************************************************************  
changed: [edgeserver01.local]  
  
TASK [Reboot after first boot steps] ********************************************************************************************************************************************************  
changed: [edgeserver01.local]  
  
TASK [Wait for reboot] **********************************************************************************************************************************************************************  
ok: [edgeserver01.local]  
  
PLAY [Setting up Edgeserver] ****************************************************************************************************************************************************************  
  
TASK [Ping host] ****************************************************************************************************************************************************************************  
ok: [edgeserver01.local]  
  
TASK [Update apt cache] *********************************************************************************************************************************************************************  
changed: [edgeserver01.local]  
  
TASK [Install required packages for this project] *******************************************************************************************************************************************  
changed: [edgeserver01.local] => (item=build-essential)  
changed: [edgeserver01.local] => (item=python3)  
changed: [edgeserver01.local] => (item=python3-pip)  
changed: [edgeserver01.local] => (item=cmake)  
changed: [edgeserver01.local] => (item=libudev-dev)  
changed: [edgeserver01.local] => (item=libusb-1.0-0-dev)  
changed: [edgeserver01.local] => (item=libffi-dev)  
changed: [edgeserver01.local] => (item=libssl-dev)  
changed: [edgeserver01.local] => (item=git)  
changed: [edgeserver01.local] => (item=minicom)  
changed: [edgeserver01.local] => (item=socat)  
changed: [edgeserver01.local] => (item=libqmi-utils)  
changed: [edgeserver01.local] => (item=udhcpc)  
changed: [edgeserver01.local] => (item=mtr)  
changed: [edgeserver01.local] => (item=gnutls-bin)  
changed: [edgeserver01.local] => (item=p7zip-full)  
changed: [edgeserver01.local] => (item=i2c-tools)  
changed: [edgeserver01.local] => (item=gpsd)  
changed: [edgeserver01.local] => (item=mlocate)  
changed: [edgeserver01.local] => (item=vim)  
changed: [edgeserver01.local] => (item=docker)  
changed: [edgeserver01.local] => (item=docker-compose)  
changed: [edgeserver01.local] => (item=htop)  
changed: [edgeserver01.local] => (item=atop)  
  
TASK [Stop docker services] *****************************************************************************************************************************************************************  
changed: [edgeserver01.local] => (item=docker.service)  
changed: [edgeserver01.local] => (item=docker.socket)  
  
TASK [Add docker group to user pi] **********************************************************************************************************************************************************  
changed: [edgeserver01.local]  
  
TASK [Upgrade all packages] *****************************************************************************************************************************************************************  
changed: [edgeserver01.local]  
  
TASK [Remove useless packages from the cache] ***********************************************************************************************************************************************  
ok: [edgeserver01.local]  
  
TASK [Remove dependencies that are no longer required] **************************************************************************************************************************************  
ok: [edgeserver01.local]  
  
TASK [Run the equivalent of "apt-get clean" as a separate step] *****************************************************************************************************************************  
ok: [edgeserver01.local]  
  
TASK [Start and Enable docker services] *****************************************************************************************************************************************************  
changed: [edgeserver01.local] => (item=docker.service)  
ok: [edgeserver01.local] => (item=docker.socket)  
  
PLAY RECAP **********************************************************************************************************************************************************************************  
edgeserver01.local         : ok=18   changed=12   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0     

</details>    
</pre>     