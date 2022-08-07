# Windows-Container-RDP-using-over-Ubuntu-Container
# Pre-requisites: Docker should be installed.  Get a ubuntu virtual machine  - Ubuntu 18.04 + , preferrably. 

@ Use below sets of commands 

Pull the ubuntu: 18.04

#docker pull ubuntu:18.04

Access Ubuntu CLI using below sets of params. 

#docker run --privileged -it --name ubuntukvm --device=/dev/kvm --device=/dev/net/tun -v /sys/fs/cgroup:/sys/fs/cgroup:rw --cap-add=NET_ADMIN --cap-add=SYS_ADMIN ubuntu:18.04 /bin/bash

Afer successful execution of above command - you will gain access to container cli. 

![image](https://user-images.githubusercontent.com/25867028/183298168-ab0b2c9f-fd20-4cfc-b529-33296691ac0d.png)

Installing deps --1
# clone this repository. 

#apt-get update -y && apt-get install -y qemu-kvm libvirt-daemon-system libvirt-dev 

Permession and Changing ownership. 

#chown root:kvm /dev/kvm

Start the libvirt services. 

#service libvirtd start
#service virtlogd start


(One can also create the same as daemon process). 

![image](https://user-images.githubusercontent.com/25867028/183298468-90a687e4-44f6-4376-a998-32eac3e22882.png)

Installing deps --2 

apt-get install -y linux-image-$(uname -r) 
if you face any issues, use the below command

#apt-get install -y linux-image-4.15.0-1010-kvm && cp /bin/true /sbin/ip6tables

Installing Deps --3
#apt install -y ssh

Installing Deps --4
#apt-get install curl -y && apt-get install net-tools -y && apt-get install jq -y

Download And Run Vagrant Apps:

![image](https://user-images.githubusercontent.com/25867028/183299544-1f030d0b-d5ab-4731-92af-ee5a85ba3682.png)

#chmod +x Helper.sh

#./Helper.sh

![image](https://user-images.githubusercontent.com/25867028/183298721-0275a745-3956-49ec-b0ec-396df3986de2.png)

@@ install plugins for vagrant windows box: 

#vagrant plugin install vagrant-libvirt

#mkdir /wind10 && cd /win10

#vagrant init peru/windows-10-enterprise-x64-eval

#VAGRANT_DEFAULT_PROVIDER=libvirt vagrant up [this command will take ample amount of time && if this command succeded you will able to see results]. 

![image](https://user-images.githubusercontent.com/25867028/183298764-1f809b23-eebd-4cf4-926f-fd1ea263d8c3.png)

![image](https://user-images.githubusercontent.com/25867028/183298974-693d4b9a-83f5-49f7-ae03-4a6ccf536e01.png)

#vagrant rdp 
[to get the IP address of the windows box]. 


### if everything is working 

open up another terminal - login to the actual VM - via SSH and execute (after taking root access): 

#apt install rdesktop

#rdesktop 172.17.0.2

if everything is okay, you should able to see below result. use Administrator or vagrant as username (2 diff usernames) and vagrant as password


![image](https://user-images.githubusercontent.com/25867028/183299175-92a52078-aed3-4beb-a7c3-8b75edb247b7.png)

After successful login.

![image](https://user-images.githubusercontent.com/25867028/183299312-29cb8259-4311-48a6-8947-8a140061c92f.png)

Once you have the access, you can start by installing Google Chrome or whatever Softwares you need to install on the system. 

# Note: 
1. Remember to commit the docker image. 
2. You may have to work with the firewall path over docker container in case you are not able to access the RDP. 
3. You have have to troubleshoot in case the Windows Box is not able to connect to the internet. Hint: You may have to look into docker network part for the same. 

Hope that helps. 
Thanks. 
