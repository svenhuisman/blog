---
id: 1198
title: 'VMware View 3.1 released : improved login times'
date: 2009-05-28T08:57:05+02:00
author: Matthijs Haverink
layout: post
guid: https://svenhuisman.com/?p=1198
permalink: /2009/05/vmware-view-31-released-improved-login-times/
categories:
  - Virtual Infrastructure
tags:
  - Login times
  - Performance Improvements
  - Performance problems
  - Update 3.1
  - View
  - View 3.1
  - VMware
---
The long awaited update (3.1) for VMware View is finally released. The most important thing in my eyes are the so called **Performance Improvements.** According to <a href="https://www.vmware.com/support/viewmanager3/doc/releasenotes_viewmanager31.html#whatsnew" target="_blank">the release notes</a> the login times are significantly improved and server utilization is reduced. I&#8217;ve seen View implementations with 3.0 which had serious problems at logon time so I hope that this solves the issue.

Besides that View Manager 3.1 includes the following enhancements:  
<!--more-->

  * **Automated LDAP Data and View Composer Database Backup &#8211;** You can now configure automated backup of LDAP data and View Composer databases in View Administrator, enabling disaster recovery.
<!-- DevPR:363762 DocPR: 366556-->

  * **Client Information &#8211;** Information about the client device that the end user is connecting from is now provided for the desktop session as registry settings. This enables customers to use third party tools or create custom scripts to map local printers to devices. The information available includes the device name, IP address, and MAC address.
  * **Improved Logging &#8211;** Debug logs are now enabled by default. Logging has been improved to provide more informational messages with minimal performance impact.
  * **Edit Desktop Wizard Navigation &#8211;** Improved wizard navigation enables you to quickly modify existing desktop pools.
  * **USB Improvements &#8211;** View 3.1 offers more reliable and broader device support with reduced bandwidth consumption. A separate TCP/IP stream is used.
  * **Multimedia Redirection (MMR) for Windows Vista &#8211;** MMR is now supported in Windows Vista environments. MMR technology delivers the multimedia stream directly to the client using an RDP virtual channel instead of decoding and rendering it with RDP. This enables full fidelity playback in View Client.
  * **Adobe Flash Bandwidth Reduction &#8211;** The Adobe Flash bandwidth reduction feature improves end-user productivity when browsing Adobe Flash content.
  * **Multi-Protocol Support &#8211;** View Client can now use HP Remote Graphics Software (RGS) as the display protocol when connecting to HP Blade PCs, HP Workstations, and HP Blade Workstations. The connection is brokered by View Manager. HP RGS is a display protocol from HP that allows a user to access the desktop of a remote computer over a standard network. VMware View 3.1 supports HP RGS Version 5.2.5. VMware does not bundle or license HP RGS with View 3.1. Please contact HP to license a copy of HP RGS software version 5.2.5 to use with View 3.1. This release does not support HP RGS connections to virtual machines.

Check out <a href="https://www.vmware.com/support/viewmanager3/doc/releasenotes_viewmanager31.html#whatsnew" target="_blank">the release notes</a> for more details.  
Download a trial or the new update <a href="https://www.vmware.com/tryvmware/?p=view&lp=1" target="_blank">here</a>.