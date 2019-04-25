---
id: 1832
title: Important vSphere ESX4.1i patch out!
date: 2010-11-16T12:22:02+02:00
author: Matthijs Haverink
layout: post
guid: http://virtualfuture.info/?p=1832
permalink: /2010/11/important-vsphere-esxi-patch-out/
categories:
  - Virtual Infrastructure
  - Virtualization news
---
**N**ormally I don&#8217;t post info about KB articles out (I don&#8217;t post a lot at all I have to be honest and ashamed to say), but yesterday a patch was released that I&#8217;d like to give some attention. One of the reasons is that I ran into some pretty heavy issues at one of my customers and this patch addresses those issues.

**The patch**: Patch ESXi410-201010401-SG  
**KB article**: <a title="http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1027021" href="http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1027021" target="_blank">1027021 </a>  
**Applies to**: ESX4.1i Installable, ESX4i Embedded  
**Released**: 15th of November 2010.

<!--more-->

One of the most important issues that is fixed is one that one of my customers ran into. It addressees various problems with VM&#8217;s running Windows Server 2003, 32-bit edition with the /3GB switch in use. They experienced spontaneous reboots of servers and unexplainable .NET and Java problems. The nasty part was that this did not occur instantly after the upgrade but a couple of days later.

> _If you start a Microsoft Windows Server 2003 32-bit virtual machine with <tt>/3GB</tt> switch defined in the <tt>boot.ini</tt> file on VMware ESXi 4.1, you might see the following symptoms:_ 
> 
>   * _Read or Write memory errors occur in the guest operating system._ 
>   * _A Remote Procedure Call (RPC) error is reported and the virtual machine is forced to reboot often._ 
>   * _A stop code of type <tt>0x000000F4</tt> occurs._ 
>   * _Microsoft .NET or Java applications might fail with memory errors._ 
>   * _The Microsoft Windows Event log might contain error messages similar to the following:  
>     <tt>Event Type: Error<br /> Event Source: .NET Runtime<br /> Event Category: None<br /> Description:.NET Runtime version 2.0.50727.3615 - Fatal Execution Engine Error (7A0979AE) (80131506)</tt>_

EDIT: <a href="http://twitter.com/lammyvm" target="_blank">Remon Lam</a> from <a href="http://www.virtualclouds.info" target="_blank">VirtualClouds.info</a> also posted an article about the problems he experienced, check out this link: <a href="http://www.virtualclouds.info/?p=1074 " target="_blank">http://www.virtualclouds.info/?p=1074 </a>

Since this is, in my opinion, a pretty default configuration that could exist in large part of the ESX4.1i install base, I thought it would be useful to give this some extra attention.

Besides the spontaneous reboots there is a number of bugs and important security issues addressed so please check out the knowledge base article <a href="http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1027021" target="_blank">here</a>.