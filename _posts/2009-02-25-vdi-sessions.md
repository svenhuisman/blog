---
id: 939
title: 'VMworld Europe 2009: Virtual desktop Infrastructure sessions'
date: 2009-02-25T20:34:35+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=939
permalink: /2009/02/vdi-sessions/
categories:
  - Virtual Desktop
  - VMworld 2009 Cannes
tags:
  - Cannes
  - design
  - sizing
  - VDI
  - View
  - virtual applications
  - Virtual Desktop
  - VMware
  - VMworld Europe 2009
---
Today I attended 3 session related to VDI, so my brain is now filled with information regarding virtual desktops, virtual applications and user workspace- or profile-management. I still need to sort all this information out to write one big or maybe a couple of smaller articles concerning design considerations, VDI server sizing, security impact, remote display protocol, performance requirements and future promises. But before I start on this article(s), here is a short overview of the sessions I attended today:<!--more-->

**<span style="text-decoration: underline;">Virtual Desktop Infrastructure: Adoption & Implications</span>**

This was a session that had a very good presenter I must say: Mark Bowker (Analyst, Enterprise Strategy Group). He talked about the research his company did on the adoption of a Virtual Desktop Infrastructure and the reasons why companies choose for VDI. He also discussed the limitations (like: user experience, video, audio, usb-support -VoIP), deployment options and how to get started. He gave an example of user thinks they get downgraded when their desktop is taken away and a thin-client is given them in exchange. the user will then blame VDI for everything, like when mail doesn&#8217;t work or an application server is down. User experience and acceptance is very important, so as an example, Mark said you could give the user 2 monitors, so the users thinks he has been upgraded. Another idea is to give the user the option to choose their own PC, where the corporate virtual desktop can run on. In this case Mark showed us a cool Macbook air. That&#8217;s definitely a way to keep the users happy 😉

**<span style="text-decoration: underline;">Server and Storage Sizing for VMware View</span>**

The first question the presenter asked was how many of the people in the audience attended the session to get some numbers on how many virtual desktops you could get on a server. He wasn&#8217;t going to give hard numbers, because that&#8217;s just not possible. It&#8217;s the same with server virtualization, where you have to monitor the physical workload of the servers to get some numbers about what kind of hardware you need to run all your servers in a virtualized environment. So when you need some numbers for your design, you have to analyse the workload of a user that&#8217;s doing daily operations (like Word, Outlook or whatever applications the user needs). You will need data on Processor, memory, disk and network usage. Perfmon is a tool that you can use to get these kind of numbers, but Capacity Planner can also be used (VMware is working on CP to get it more suitable for desktops as well).  
A lot of good tips were given that you should take into consideration and I will post them in all in a later post.  
There is a <a title="VMware View reference architecture" href="http://www.vmware.com/resources/wp/view_reference_architecture_thanks.html" target="_blank">VMware View reference Architecture document</a> available that was mentioned a couple of times.

**<span style="text-decoration: underline;">Breaking Down Desktop and Application Virtualization Alternatives</span>**

This session was presented by the well-known <a title="Chris Wolf" href="http://www.chriswolf.com/" target="_blank">Chris Wolf</a>, Senior Analyst at the Burton Group. This was the first time I saw him present at an event and I must say that he did a good job. Although he ran out of time, so at the end, he quickly finished up his presentation. I think if he left out the explanation of what the differences were between the types of client virtualization (and the pro and coons for each), the session would have been a little better.  
Chris talked about making the business case for desktop virtualization and what options are available. The most  import thing, and I heard this as well in other sessions, is that there is no One-Size-Fits-All solution. You will not be able to get 100% users on a virtual desktop or a 100% of your applications virtualized.