---
id: 1007
title: VirtualCenter on Linux
date: 2009-03-11T13:23:30+02:00
author: Johan
layout: post
guid: https://svenhuisman.com/?p=1007
permalink: /2009/03/virtualcenter-on-linux/
categories:
  - Virtual Infrastructure
tags:
  - ESX
  - Linux
  - vCenter
  - VI3
  - VMware
  - VMware VCenter
---
I was interested about the beta vCenter based on Linux. After i did read the [documentation](http://communities.vmware.com/docs/DOC-9580), I downloaded the <a title="vcserver_linux" href="http://communities.vmware.com/community/beta/vcserver_linux" target="_blank">Virtual Appliance</a>.

<p style="text-align: left;">
  The VirtualCenter on Linux appliance uses Red Hat Community Enterprise Operating System (CentOS), version 5, as the base operating system. VirtualCenter on Linux is based on VMware VirtualCenter server, version 3.5. VirtualCenter has been modified to operate on a Linux operating system.
</p>

Since I was recently involved with some RedHat Enterprise Linux implementations, I would give it a try.<!--more-->

First I downloaded the required packages:  
&#8211; [VirtualCenter for Linux Virtual Appliance](http://communities.vmware.com/community/beta/vcserver_linux)  
&#8211; [Oracle Express Edition 10g for Windows](http://www.oracle.com/technology/software/products/database/xe/index.html)  
&#8211; [ODBC drivers for the VA](http://www.oracle.com/technology/software/tech/oci/instantclient/htdocs/linuxsoft.html)

I refer to the documentation for more information about the Oracle Express and Oracle ODBC installation.

_Step 1. install Oracle Express_

Since Oracle Express is free to use, you can download this package for free from the Oracle website.  
Install Oracle Express Edition for Windows. The minimal OS requirements are Windows 2000 SP4, Windows 2003 or Windows XP SP1.  
I decided to install Oracle Express on a Windows 2003 Server, which is quite easy to do. Just follow the installation instructions described in this [Oracle installation document](http://download.oracle.com/docs/cd/B25329_01/doc/install.102/b25143/toc.htm#BABGGAJA).

_Step 2.install VA and install Oracle components_

Download and install the Virtual Appliance. Choose for the ZIP file and extract it to your datastore and import the VA.  
Boot the appliance and follow the installation instructions on the console. Do not enable NIS support unless you have a valid NIS server in your network.

After this you see a window displayed in your console. Choose for login. Use the username root and password vmware to login.

<img class="aligncenter size-medium wp-image-1026" title="vcenterconsole" src="https://svenhuisman.com/wp-content/uploads/2009/03/vcenterconsole-350x91.jpg" alt="vcenterconsole" width="350" height="91" srcset="https://svenhuisman.com/wp-content/uploads/2009/03/vcenterconsole-350x91.jpg 350w, https://svenhuisman.com/wp-content/uploads/2009/03/vcenterconsole.jpg 674w" sizes="(max-width: 350px) 100vw, 350px" />  
Right now you have to upload the required Oracle packages. Use your favorite SCP program to upload them to the VA.  
Place both files in the /root folder and reboot the appliance. The files will be installed automatically.  
The setup asks you to give some Oracle parameters. Ip adress of the Oracle server (in my case the Win2003 server with Oracle XE installed), database instance name (xe by default), username (system by default), password (password you entered during Oracle setup). Setup completes the installation and you are ready to go.

_Step 3. Connect to Linux Vcenter_

You can check the connection between your workstation and Linux Vcenter by entering the VCenter IP adress in your webbrowser.  
If everything is OK you see the VMware Virtual Center 2 welcome page. With this page you are able to download and install the VI Client. I guess you already have it installed on your desktop.

<img class="size-medium wp-image-1028 aligncenter" title="welcome" src="https://svenhuisman.com/wp-content/uploads/2009/03/welcome-350x187.jpg" alt="welcome" width="350" height="187" srcset="https://svenhuisman.com/wp-content/uploads/2009/03/welcome-350x187.jpg 350w, https://svenhuisman.com/wp-content/uploads/2009/03/welcome.jpg 450w" sizes="(max-width: 350px) 100vw, 350px" /> 

Open the VI Client application and use the ip adress of the Linux VCenter as the hostname and root as loginname and vmware as password. After the &#8220;loading inventory&#8221; process, you are able to add a VMware host. In my case it&#8217;s my local VMware Server instance. I used &#8220;vmwareserver_ip:8333&#8221; as the hostname with the credentials I use for VMware Server.

<img class="aligncenter size-medium wp-image-1027" title="vcenteronlinux" src="https://svenhuisman.com/wp-content/uploads/2009/03/vcenteronlinux-350x222.jpg" alt="vcenteronlinux" width="350" height="222" srcset="https://svenhuisman.com/wp-content/uploads/2009/03/vcenteronlinux-350x222.jpg 350w, https://svenhuisman.com/wp-content/uploads/2009/03/vcenteronlinux.jpg 402w" sizes="(max-width: 350px) 100vw, 350px" /> 

 

Great! It works. I see all of the local Virtual Machines I installed before, and right now I can manage them with VCenter.  
Okay, not a big deal since you could already connect your VMware Server instance with VCenter based on Windows, but hey this is great news for Linux fans, right?

<img class="aligncenter size-full wp-image-1025" title="vcenter" src="https://svenhuisman.com/wp-content/uploads/2009/03/vcenter.jpg" alt="vcenter" width="272" height="162" /> 

There are some components unavailable. There is no VI Web Access, no LDAP support, no embedded database support etc.  
Features like monitoring, alarms, scheduled tasks and topology maps are unavailable too. However, i could show a topology map and create an alarm for a virtual machine.

I hope this Linux integration will reach a production ready status and will support for Microsoft SQL support in the nearby feature.