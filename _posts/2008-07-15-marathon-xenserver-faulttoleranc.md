---
id: 81
title: Xenserver 4.2 will have HA for free!
date: 2008-07-15T16:25:19+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=81
permalink: /2008/07/marathon-xenserver-faulttoleranc/
categories:
  - Virtualization news
tags:
  - Citrix
  - everrun
  - marathon
  - VMware
  - xenserver
---
[](https://svenhuisman.com/wp-content/uploads/2008/07/everrun_vm.jpg)You might have read about <a title="Marathon Everrun VM" href="https://www.marathontechnologies.com/press_release.html?id=538&rand=967565099" target="_blank">the news</a> that <a title="Marathon Technologies" href="https://www.marathontechnologies.com" target="_blank">Marathon Technologies</a> recently launched a new product called <a title="EverRun VM" href="https://www.marathontechnologies.com/high_availability_xenserver.html" target="_blank">EverRun VM</a>. This comes as an add-on for Citrix Xenserver and it can protect virtual machines from hardware failures. There are 3 levels of protection, and one of them will come for free with <a title="Xenserver" href="https://www.citrix.com/xenserver" target="_blank">Xenserver</a> 4.2!

<p style="text-align: center;">
  <img class="size-medium wp-image-82" title="everrun_vm" src="https://svenhuisman.com/wp-content/uploads/2008/07/everrun_vm-300x166.jpg" alt="" width="300" height="166" srcset="https://svenhuisman.com/wp-content/uploads/2008/07/everrun_vm-300x166.jpg 300w, https://svenhuisman.com/wp-content/uploads/2008/07/everrun_vm.jpg 450w" sizes="(max-width: 300px) 100vw, 300px" />
</p>

<!--more-->

Today I attended a demonstration of Marathon EverRun VM. I had heard of Marathon Technologies before and I knew it was expensive. But today I saw Marathon EverRun VM and it will have pretty competitive pricing comparing to VMware. Besides that, it&#8217;s a better feature than HA from VMware.

With Marathon EverRun VM there will be 3 levels of protection:

**Level 1: Basic Failover** (will come free with Xenserver 4.2, probably September)  
When one host crashes, the virtual machine will start up on the other host.

**Level 2: component-level fault tolerance** (available now)  
Creates a virtual machine on top of 2 other virtual machines. The Marathon-VM runs on 1 virtual machine and synchronises IO to the other virtual machine. If, for example, the disk fails in one virtual machine, the disk in the other virtual machine will take over.  
Pricing: single server (max 4 socket) including Xenserver Enterprise: €3400,- and €1500,- excluding Xenserver Enterprise. Both excluding support (25% per year).

**Level 3: System-level tolerance** (available Q4 2008)  
Protects VMs against any type of failure and maintains the applications and memory in their pre-failure state.

<img class="aligncenter size-full wp-image-83" title="everruninterface" src="https://svenhuisman.com/wp-content/uploads/2008/07/everruninterface.jpg" alt="" width="500" height="340" srcset="https://svenhuisman.com/wp-content/uploads/2008/07/everruninterface.jpg 825w, https://svenhuisman.com/wp-content/uploads/2008/07/everruninterface-300x204.jpg 300w" sizes="(max-width: 500px) 100vw, 500px" /> 

_The EverRun userinterface will replace XenCenter in the near future._

 

EverRun VM includes <a title="Splitsite" href="https://www.marathontechnologies.com/virtualization_and_disaster_recovery.html" target="_blank">SplitSite</a> which enables fault tolerance between geographically dispersed locations.

Advantages:

  * Uninterrupted availability
  * No shared storage required
  * All windows applications can be high available
  * No need for Windows Server Enterprise licenses
  * No complex clustering
  * Easy management

I know <a title="VMware" href="https://www.vmware.com" target="_blank">VMware</a> is working on Continuous availability, <a title="Continuous availability" href="https://blog.scottlowe.org/2007/09/13/vmworld-2007-day-3-keynote-liveblog/" target="_blank">demonstrated almost a year ago at VMworld 2007</a>, but haven&#8217;t heard anything since. Maybe we will hear something at <a title="VMworld 2008" href="https://www.vmworld.com/conferences/2008" target="_blank">VMworld 2008</a> in september&#8230;