---
id: 1894
title: What is the impact of Application Virtualization on VDI?
date: 2011-06-16T17:32:45+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=1894
permalink: /2011/06/impact-appvirt-vd/
image: /wp-content/uploads/2011/06/VRC.png
categories:
  - Virtual Applications
  - Virtual Desktop
tags:
  - App-V Application Streaming
  - Application Virtualization
  - Citrix
  - IOPS
  - Microsoft
  - ProjectVRC
  - Thinapp
  - VMware
---
> “_It is currently almost impossible to conceive a VDI deployment without Application Virtualization. The management benefits of Application Virtualization are real and proven, especially within centrally hosted virtualized desktops. By isolating/virtualizing applications and streaming these on demand, a much more dynamic and flexible delivery of applications is possible in comparison to classic MSI installations. Typically, when a VDI deployment needs to support many applications, Application Virtualization becomes a key component to its long term success._  
> _Besides of all the Application Virtualization benefits there are some down-sides as well. Some of these are: not all applications can be virtualized, interaction between applications can be a challenge and there is an overhead on the system resources such as CPU, Memory and storage._  
> _The primary goal of Project Virtual Reality Check phase IV is to investigate the overall scalability impact of using Application Virtualization solutions within VDI.  The three biggest and most commonly used vendors in the VDI market space are investigated: Citrix Application Streaming, Microsoft App-V and VMware ThinApp. These three solutions were compared in different streaming configurations, and Office 2007 was virtualized together with other applications.”_

This is the introduction of the new whitepaper <a title="Project Virtual Reality Check" href="http://projectvrc.nl/" target="_blank">Project Virtual Reality Check</a> just released. <!--more-->Being a member of the Project VRC team, I’m really proud this whitepaper is finally publicly available. A lot of effort is put into this whitepaper and reading this whitepaper you will learn what the difference in impact is between Citrix Application Streaming, Microsoft App-V and VMware ThinApp. You can also read what the difference in impact is on the storage (IOPS), a subject that’s really important in a VDI scenario (read “

<a title="VDI and Storage = Deep Imact" href="www.virtuall.eu/download-document/vdi-storage-deep-impact" target="_blank">VDI and storage = Deep Impact</a>”).

[<img class="aligncenter size-medium wp-image-1895" title="VRCAppvirt" src="https://svenhuisman.com/wp-content/uploads/2011/06/VRCAppvirt-350x239.png" alt="" width="350" height="239" srcset="https://svenhuisman.com/wp-content/uploads/2011/06/VRCAppvirt-350x239.png 350w, https://svenhuisman.com/wp-content/uploads/2011/06/VRCAppvirt.png 427w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2011/06/VRCAppvirt.png)

Depending on the use case scenario, Project VRC discovered that the impact of application virtualization can be significant. Test results show that Application Virtualization has impact on the VDI user density, which can be decreased by 20% &#8211; 45% when Office 2007 is completely virtualized. This should be considered as a worst case scenario. When only a portion of specific (business) applications are virtualized, the session density decreased by only 3-12%.  
In practice the overhead will be highly dependent on how often virtualized applications are started: specifically the creation of the virtualization ‘bubble’/environment for the application can have a significant overhead.

Download the &#8220;<a title="Virtual Reality Check Phase 4 whitepaper" href="http://www.virtualrealitycheck.net/" target="_blank">Project Virtual Reality Check Phase 4: Impact of Application Virtualization on VDI</a>&#8221; whitepaper and read about the impact, lessons learned and best practices.