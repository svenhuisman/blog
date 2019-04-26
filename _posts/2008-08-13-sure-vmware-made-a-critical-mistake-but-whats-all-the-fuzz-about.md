---
id: 248
title: 'Sure, VMWare made a (critical) mistake, but what&#8217;s all the fuzz about ?'
date: 2008-08-13T12:50:36+02:00
author: Matthijs Haverink
layout: post
guid: https://svenhuisman.com/?p=248
permalink: /2008/08/sure-vmware-made-a-critical-mistake-but-whats-all-the-fuzz-about/
categories:
  - Virtual Infrastructure
tags:
  - Express Update
  - Hyper-V
  - Update 2
  - VMware
  - xenserver
---
**Sure, <a href="https://svenhuisman.com/2008/08/vmware-released-express-update/" target="_blank">you&#8217;ve read about the Update 2 troubles</a>.** **VMWare made a huge mistake** by releasing something with trial-code in it, and the impact can be huge when put into production **but there&#8217;s what&#8217;s bugging me** : the whole world is acting like the impact it has is catastrophic.

<a href="https://www.virtualization.info/2008/08/vmware-mistake-shuts-down-thousands-of.html" target="_blank">Virtualization.info started with the topic title</a> &#8220;VMWare mistake shuts down thousands of Virtual Infrastructures&#8221;, later on nuanced by &#8220;may shut down&#8221;. They also state that 95% of the Fortune 500 customers use VMWare and over 50% uses VMotion. Yeah, sure they do, but do you really think that administrators working at a _Fortune 500_ company think : &#8220;_hey wow a new patch; it&#8217;s from VMWare so it&#8217;ll be good; let&#8217;s put it into production right now!_&#8221; ?

Really, lots of people are acting like there are hundreds of thousands of virtual servers around the world that have been down and we should all stop using VMWare and switch to the &#8220;beautiful&#8221; Hyper-V or XenServer solution but:<!--more-->

**1.**Every administrator with the tiniest brain doesn&#8217;t instantly put a patch into a production environment. If you have a big environment you&#8217;ll have a test-environment also. Before you can get a patch from download, through test to production, it will take you a couple of weeks. Let me state that this of course is a bug that in 99 of 100 test environments will slip through but it needs to be tested anyway. If you have a small environment you should have the sense to wait at least a couple of weeks, I prefer a month, to see if you see any horror stories like this are flying around the world.  
**2.**The effect of the patch isn&#8217;t that servers are shut down. It is that servers cannot be powered-on or VMotioned anymore. In a production environment : how often do you power-down a (virtual) server?  
**3.** The combination with patch Tuesday is said to be a bad combination but even when you are someone who directly applies Windows patches (see my thoughts about that at point 1.) and the server reboots automatically, this will still work because the machine isn&#8217;t powered down.  
**4.** Like Microsoft never released a patch or a product that has brought loads of customers in trouble. And did we all switch to another OS?  
**5.**Switching to Hyper-V or XenServer: we all know that both products cannot tip the feature set of VMWare. Sure, if you don&#8217;t need VMotion or HA capabilities and other nice VMWare features, maybe Hyper-V is fine for you. But the so called _Fortune 500-like_ companies won&#8217;t make that switch now.  
**6.** They <a href="https://www.vmware.com/landing_pages/esxexpresspatches.html" target="_blank">released a patch</a> within the promised 36 hours.

<span style="text-decoration: underline;">Don&#8217;t get me wrong</span>; I don&#8217;t understand how VMWare can release such a patch. Their reputation won&#8217;t get any better by actions like these either but I think that very little companies have really experienced real trouble because of this update.

**So my question remains: what&#8217;s all the fuzz about ???**