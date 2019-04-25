---
id: 1049
title: Veeam Backup 3.01 released
date: 2009-03-17T18:28:12+02:00
author: Matthijs Haverink
layout: post
guid: https://svenhuisman.com/?p=1049
permalink: /2009/03/veeam-backup-301-released/
categories:
  - Virtual Infrastructure
  - Virtualization news
tags:
  - download here
  - release notes
  - Update
  - Veeam Backup
---
<img class="alignleft" title="Veeam" src="http://virtualize-it.highspeed-data.net/wp-content/uploads/2008/12/veeam.gif" alt="" width="190" height="70" /><a href="http://www.veeam.com" target="_blank">Veeam</a> just released a new version of Veeam Backup : 3.01.

Version 3.01 has 2 new features and a set of resolved issues. Recap :

**New features introduced in the Veeam Backup 3.0.1:**

_&#8211; Redistributed version of Microsoft SQL 2005 Express Edition updated to SP3._

_&#8211; Multiple File-Level Restore plug-in enhancements (refer to the_ <a title="Veeam" href="http://www.veeam.com/vmware-esx-server/backup/documents/Veeam_Backup_FLR_Plugin_Release_Notes_3.0.1.pdf" target="_blank"><em>FLR plug-in Release Notes</em></a> _for more information)._

 <!--more-->

**A couple of resolved issues:**

_&#8211; If the daily job’s schedule is set to skip some days, the job always starts at 12am on th next day it is allowed to run._

_&#8211; Depending on the replicated virtual machine’s VMX file content, failover to a replica could fail to execute with the following error:Invalid snapshot configuration was detected or File not found.  
   
&#8211; When virtual machine has more than one network interface, then depending on exact VSS inte e could fail wollowing[xxx.xxx. networking configuration, Veeam gration modul ith the f error: Cannot connect to the host&#8217;s administrative share. Host: xxx.xxx].  
   
&#8211; Veeam VSS module produces the following unneeded warning when attempting to process shut down vVSS irtua l machines: Releasing VM files Failed to perform Veeam freeze: VM state is &#8220;poweredOff&#8221;.  
_ 

**  
C**heck the complete <a href="http://www.veeam.com/vmware-esx-server/backup/documents/Veeam_Backup_FLR_Plugin_Release_Notes_3.0.1.pdf" target="_blank">release notes for Veeam Backup 3.01 here</a>. [PDF]  
You can <a href="http://www.veeam.com/download.asp?step=2&license_type=37&ad=Backup_update_3.0.1" target="_blank">download Veeam Backup Update 3.01 right here</a>.