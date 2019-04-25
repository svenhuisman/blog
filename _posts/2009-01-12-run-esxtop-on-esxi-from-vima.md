---
id: 650
title: Run esxtop on ESXi from VIMA
date: 2009-01-12T20:34:49+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=650
permalink: /2009/01/run-esxtop-on-esxi-from-vima/
categories:
  - Virtualization news
tags:
  - esxi
  - esxtop
  - Remote CLI
  - resxtop
  - VIMA
  - VMware
---
When it comes to troubleshooting on VMware ESX, esxtop is a tool that always comes in handy. CPU, memory, network and disk-related problems can be pinpointed with esxtop. Unfortunately, esxtop must be executed from the service console and my ESXi server doesn&#8217;t have that. I was looking for a way to use esxtop with ESXi and I found out that you can use resxtop. resxtop is the Remote CLI version of esxtop.

> <!--more-->
> 
> _Remote CLI commands allow you to perform many of the operations you might currently perform using the ESX Server 3 service console. Remote CLI commands are especially useful for an ESX Server 3i host because it does not include a service console._

So what are my options:

  * I can install a <a title="Remote CLI" href="https://www.vmware.com/pdf/vi3_35/esx_3/r35u2/vi3_35_25_u2_rcli.pdf" target="_blank">Remote CLI</a> package on one server, which could become the administration server for all ESX(i) Server hosts.
  * Download the Remote CLI virtual appliance and import it into a VirtualCenter Server or ESX Server host. The Remote CLI virtual appliance is a virtual machine prepackaged with a pared-down Linux operating system, the VI Perl Toolkit, and all Remote CLI commands.
  * Download VIMA. The <a title="VMware VIMA" href="https://www.vmware.com/support/developer/vima/" target="_blank">VMware Infrastructure Management Assistant (VIMA)</a> is a virtual machine which includes prepackaged software that developers and administrators can use to run agents and scripts to manage ESX and ESXi systems. The remote CLI is included with VIMA.

I was already running th VIMA appliance, so it wasn&#8217;t hard to decide which option I should go for.

As I already registered my ESXi server with VIMA, all I had to do was log in to VIMA and execute the following command:

resxtop.sh &#8211;server esx01._domain.local_

[<img class="aligncenter size-medium wp-image-653" title="resxtop1" src="https://svenhuisman.com/wp-content/uploads/2009/01/resxtop1-300x205.jpg" alt="" width="300" height="205" />](https://svenhuisman.com/wp-content/uploads/2009/01/resxtop1.jpg)

[<img class="aligncenter size-medium wp-image-654" title="resxtop2" src="https://svenhuisman.com/wp-content/uploads/2009/01/resxtop2-300x205.jpg" alt="" width="300" height="205" />](https://svenhuisman.com/wp-content/uploads/2009/01/resxtop2.jpg)

There are some  known issues with running resxtop through VIMA:

Some Remote CLI commands do not support vi-fastpass  
**Description**: The svmotion, vmware-cmd, and resxtop Remote CLI commands do not support vi-fastpass.  
**Workaround**: You can still execute the commands as Remote CLIs. Set up a connection to the target server using a session file or environment variable. For svmotion and vmware-cmd, you can specify the &#8211;username and &#8211;password options when you execute the command. See the next issue for using these options in conjunction with resxtop.

After vi-fastpass has been set up, resxtop does not work correctly with other servers  
**Description**: If you set up some target servers for VIMA and run resxtop.sh &#8211;server myTarget, the command succeeds with a minor error that you can ignore. However, if you attempt to run resxtop using the &#8211;server, &#8211;username, &#8211;password options supported for all Remote CLIs, the command fails.  
**Workaround**:  
Login to VIMA  
Unset the following variables by issuing the following commands:  
unset LD_PRELOAD  
unset LD_LIBRARY

Now run resxtop.sh  
   
Cannot run resxtop in replay mode using VIMA  
**Description**: Running resxtop in replay mode using VIMA is not supported.  
**Workaround**: No workaround. Note, however, that resxtop is supported in interactive mode.