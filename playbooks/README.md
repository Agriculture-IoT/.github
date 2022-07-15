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
PLAY [edgeserver setup] *********************************************************************************************************************************************************

TASK [base : Ping host] *********************************************************************************************************************************************************
ok: [edgeserver01.local]

TASK [base : Update /etc/dhcpcd.conf] *******************************************************************************************************************************************
changed: [edgeserver01.local]

TASK [base : Disable WiFi power_save] *******************************************************************************************************************************************
changed: [edgeserver01.local]

TASK [base : Update /etc/apt/apt.conf.d/99force-ipv4] ***************************************************************************************************************************
changed: [edgeserver01.local]

TASK [base : Disable bluetooth systemd] *****************************************************************************************************************************************
changed: [edgeserver01.local]

TASK [base : Disable console autologin] *****************************************************************************************************************************************
changed: [edgeserver01.local]

TASK [base : reboot pi] *********************************************************************************************************************************************************
changed: [edgeserver01.local]

TASK [base : Wait for reboot] ***************************************************************************************************************************************************
ok: [edgeserver01.local]

TASK [lorabasics : Ping host] ***************************************************************************************************************************************************
ok: [edgeserver01.local]

TASK [lorabasics : Update apt cache] ********************************************************************************************************************************************
changed: [edgeserver01.local]

TASK [lorabasics : Install required packages for this project] ******************************************************************************************************************
changed: [edgeserver01.local]

TASK [lorabasics : apt upgrade] *************************************************************************************************************************************************
changed: [edgeserver01.local]

TASK [lorabasics : Remove useless packages from the cache] **********************************************************************************************************************
ok: [edgeserver01.local]

TASK [lorabasics : Remove dependencies that are no longer required] *************************************************************************************************************
ok: [edgeserver01.local]

TASK [lorabasics : apt clean] ***************************************************************************************************************************************************
ok: [edgeserver01.local]

TASK [lorabasics : Stop docker services] ****************************************************************************************************************************************
changed: [edgeserver01.local] => (item=docker.service)
changed: [edgeserver01.local] => (item=docker.socket)

TASK [lorabasics : Add docker group to user pi] *********************************************************************************************************************************
changed: [edgeserver01.local]

TASK [lorabasics : Start and Enable docker services] ****************************************************************************************************************************
changed: [edgeserver01.local] => (item=docker.service)
ok: [edgeserver01.local] => (item=docker.socket)

TASK [chirpstack : Ping host] ***************************************************************************************************************************************************
ok: [edgeserver01.local]

TASK [chirpstack : Create directory] ********************************************************************************************************************************************
changed: [edgeserver01.local] => (item=/edgeserver)

TASK [chirpstack : copy files to remote] ****************************************************************************************************************************************
changed: [edgeserver01.local]

TASK [apps : Create rabbitmq logs directory] ************************************************************************************************************************************
changed: [edgeserver01.local]

TASK [apps : start rabbitmq] ****************************************************************************************************************************************************
changed: [edgeserver01.local]

TASK [apps : start influxdb] ****************************************************************************************************************************************************
changed: [edgeserver01.local]

TASK [apps : start nodered] *****************************************************************************************************************************************************
changed: [edgeserver01.local]

TASK [apps : start vault] *******************************************************************************************************************************************************
changed: [edgeserver01.local]

PLAY RECAP **********************************************************************************************************************************************************************
edgeserver01.local         : ok=26   changed=19   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
</details>    
</pre>     