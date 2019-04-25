---
id: 353
title: 'VMworld 2008 &#8211; New Feature: Fault Tolerant'
date: 2008-09-16T22:23:34+02:00
author: Johan
layout: post
guid: http://virtualfuture.info/?p=353
permalink: /2008/09/vmworld-2008-new-feature-fault-tolerant/
categories:
  - Virtualization news
  - VMworld 2008 Vegas
tags:
  - Fault Tolerant
  - VMware
  - VMworld 2008
---
At VMworld I have attended a session about another new feature called Fault Tolerant. This cool feature will be released somewhere in 2009, with the release of what is suppose to be ESX4.0. It&#8217;s an addition of the other high availibity services like VMotion, HA and DRS. As a matter of fact it uses a modified VMotion technique to clone a live machine in memory to another host and disconnect that secondary machine from the network so that it doesn&#8217;t accept any connection.<!--more-->

What it does sounds simple: have another virtual machine running without network connection and have it replay every thing the active does. So it&#8217;s a zero down time &#8211; zero dataloss technology.

The replay function has been in VMware Workstation for a year now so VMware certainly has experience with it. When activated it creates a VM through an modified VMotion technique, after that every command, interrupt en so on is replicated to the passive node. In case of host failure (the entire ESX host dies) the standbye node instantanious takes over, even without software disconnects from the clients.  A new secondary VM is being created on another host after that so that the machine is fully protected again.

It has specific requirements and some of the drawbacks may be removed in the final product:  

  * it only supports 1way SMP
  * not physical raw device mappings although virtual RDM&#8217;s are supported
  * no storage VMotion
  * HV-compatible processor (that&#8217;s VT enabled)
  * Separate NIC for FT Logging
  * Same build of ESX

It sounds that Marathon everrun has got a competitor for their product what VMware needs to address is the ability to have the VM on different storage, it is goint to use shared storage.