---
id: 2533
title: VMware View Desktop plugin for vSphere Web Client
date: 2013-04-22T17:26:14+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=2533
permalink: /2013/04/vmware-view-desktop-plugin-for-vsphere-web-client/
categories:
  - Virtual Desktop
tags:
  - Horizon
  - View
  - VMware View
  - vSphere
  - Web Plugin
---
Today I installed the VMware View Desktops Plug-in on the vSphere Web Client. This plugin is a Technical Preview included with Horizon View 5.2. After installing this plugin you can use the vSphere Web Client to search for a View Desktop user and the Web Client will show the virtual desktop(s) that the user is logged on to. You can use this tool to troubleshoot issues that may arise with an end user&#8217;s virtual desktop. If a user calls in with a problem, you can immediately jump to the user&#8217;s VM and troubleshoot from there.

**Installation**

The installation is well described in the README.txt file which is located in the following path:  
C:\<VIEW-installed-directory>\Server\TechPreview\ViewAdminPlugin

The View Desktops plug-in works with vSphere 5.1 and later versions only. Make sure system clocks are synchronized and valid SSL server certificates are issued with the correct hostnames on all servers.

Before you register the Plugin, VMware recommends to snapshot the vSphere SSO server system, vSphere Web Client system, and vCenter Server system. It&#8217;s called a Tech Preview, so when something goes terrible wrong, you can revert to snapshot.  
First, you need to configure View to recognize the vCenter Lookup Service. You perform this configuration task once for all View Connection Server instances in a replicated group:

  1. Open a command prompt on View Connection Server to run the regtool.cmd utility.
  2. cd C:\<VIEW-installed-directory>\Server\TechPreview\ViewAdminPlugin
  3. (Optional) set JAVA\_HOME to <jre-folder> (set JAVA\_HOME=c:\Program Files\VMware\VMware View\Server\jre)
  4. Configure the Lookup Service: regtool.cmd configureLookupService -u @ -ld https://:7444/lookupservice/sdk
  5. If the command fails because the certificate is not trusted, accept the certificate thumbprint: regtool.cmd configureLookupService -u @ -ld https://:7444/lookupservice/sdk -lt

When you type the password, the following warning message might appear. You can ignore this message:

<pre><em>log4j: WARN No appenders could be found for logger </em>
<em>&lt;com.vmware.vim.vmomi.core.types.impl.VmodlContextImpl&gt;.</em>
<em>log4j: WARN Please initialize the log4j system properly</em></pre>

Next, you register the View Desktops plug-in. You need to perform these steps on every View Connection Server in a replicated group:<!--more-->

  1. Register View Desktops plug-in: regtool.cmd register -u @ -lu @ (@System-Domain for local user)
  2. Show registration details: regtool.cmd showDetails -u @

**Use it**

The functionality of the View Desktops Plugin is very basic at the moment. What you can do with it is search a user and the Web Client will match the VM-object the user is logged on to.

Log in to the vSphere Web Client as a user with the View Administrators role or View Administrators (read-only) role:

[<img class="size-medium wp-image-2534 alignnone" alt="" src="https://svenhuisman.com/wp-content/uploads/2013/04/Capture-350x199.png" width="350" height="199" srcset="https://svenhuisman.com/wp-content/uploads/2013/04/Capture-350x199.png 350w, https://svenhuisman.com/wp-content/uploads/2013/04/Capture.png 966w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2013/04/Capture.png)  
Type a username of a View desktop user in the Search box:

[<img class="size-medium wp-image-2535 alignnone" alt="" src="https://svenhuisman.com/wp-content/uploads/2013/04/Capture2-350x108.png" width="350" height="108" srcset="https://svenhuisman.com/wp-content/uploads/2013/04/Capture2-350x108.png 350w, https://svenhuisman.com/wp-content/uploads/2013/04/Capture2.png 536w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2013/04/Capture2.png)

Select the username from the search results:

[<img class="size-medium wp-image-2536 alignnone" alt="" src="https://svenhuisman.com/wp-content/uploads/2013/04/Capture3-350x143.png" width="350" height="143" srcset="https://svenhuisman.com/wp-content/uploads/2013/04/Capture3-350x143.png 350w, https://svenhuisman.com/wp-content/uploads/2013/04/Capture3.png 936w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2013/04/Capture3.png)

Then, you select the desktop and use the Virtual Machine page to see details about the desktop virtual machine.

&nbsp;

In the Technical Preview you can see where the management interface of View is heading to. I expect that the View Admin console will be more integrated in the vSphere Web Client in a future release. But that is just my speculation.