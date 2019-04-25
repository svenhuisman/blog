---
id: 1095
title: 'Citrix XenApp on VMware ESX: 1 or 2 vCPU part 2'
date: 2009-04-07T11:50:18+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=1095
permalink: /2009/04/citrix-xenapp-on-vmware-esx-1-or-2-vcpu-part-2/
categories:
  - Virtual Applications
tags:
  - Citrix
  - ESX
  - VMware
  - XenApp
---
One month ago I wrote a blogpost about <a title="XenApp on ESX: 1 or 2 vCPU" href="https://svenhuisman.com/2009/03/citrix-xenapp-on-vmware-esx-1-or-2-vcpu/" target="_blank">using 1 or 2 vCPUs on Citrix XenApp VMs</a>. My conclusions in that blogpost were:

&#8211; 2 vCPU terminal server (or XenApp) VMs allows more users and gives a more consistent user experience  
&#8211; Use dedicated hardware (ESX cluster) for the TS/XenApp VMs  
&#8211; Don’t overcommit total amount of vCPUs

I stated this conclusion to get some reactions and it worked. Because as <a title="Boche.net" href="http://www.boche.net/blog/" target="_blank">Jason Boche</a> commented on the article: It depends!<!--more-->

> _&#8220;It’s all about the workloads and each company and environment will have different workloads. Traditionally speaking, published desktops chew up a lot more server resources than published applications.&#8221;_

I couldn&#8217;t agree more, it depends on the workloads.

For the first point, Duncan Epping from <a title="Yellow-Bricks" href="http://www.yellow-bricks.com/2009/03/06/virtualized-mmu-and-tp/" target="_blank">yellow-bricks</a> tested in a lab-environment and he stated that he could get more users on a box with 1 vCPU machines than with 2 vCPU machines. That could be true, because <a title="www.virtu-al.net" href="http://www.virtu-al.net" target="_blank">Alan Renouf</a> tested it and came to the [same conclusion](http://www.virtu-al.net/2008/11/29/citrix-on-vmware-1vcpu-or-2vcpu/ "virtu-al.net - XenApp"), but how about user experience?

Recently I&#8217;ve tested both 1 and 2 vCPU VMs with Citrix XenApp in 2 different (but similar) environments. Both environments uses published desktops with RES Powerfuse for user environment management. Hardware was similar as well: a dual quadcore server with 24GB RAM.  
Scenario 1 had 5-10 users on each VM and in scenario 2 each VM had 20-25 users on it. In these 2 cases, 2 vCPU VM&#8217;s gave a better user experience than a 1 vCPU VM, regardless of the number of users on each VM. In this case a better user experience can be a faster login time, faster application startup times, less screen delays, etc.  
Also, I monitored the %RDY time on the VMs. When I did not overcommit the number of vCPUs (except for the use of service console) the %RDY time was good: between 0% and 4%. That was with 4 dual vCPU XenApp VMs. When I added a 2 vCPU XenApp VM, the %RDY time started to spike: 5% &#8211; 35%. Overcommit on CPU is a NOGO with 2 vCPU (XenApp) VMs.

So XenApp in a virtualized environment can be tricky. In the next project where I&#8217;m going to use published desktops with RES Powerfuse, I probably go for 2 vCPU XenApp VM&#8217;s, but it depends&#8230; ;-). At least I now know that using 2 vCPU on a virtual XenApp server isn&#8217;t a NOGO anymore.