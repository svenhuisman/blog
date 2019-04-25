---
id: 948
title: 'Citrix XenApp on VMware ESX: 1 or 2 vCPU?'
date: 2009-03-05T13:00:56+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=948
permalink: /2009/03/citrix-xenapp-on-vmware-esx-1-or-2-vcpu/
categories:
  - Virtual Applications
tags:
  - Citrix
  - ESX
  - VMware
  - VRC
  - XenApp
---
In the past I&#8217;ve published two articles (<a title="Citrix on VI3" href="https://svenhuisman.com/2008/07/citrix-on-vi3x-recommendations/" target="_blank">here</a> and <a title="XenApp in vmware" href="https://svenhuisman.com/2008/10/more-xenapp-45-on-vmware-recommendations/" target="_blank">here</a>) about best practices on running Citrix XenApp (presentation server) on VMware ESX. It were all best practices gathered by other people, but I agreed with a lot of the recommendations. Until recently, I did also agree on using 1 vCPU XenApp virtual machines (with less users per VM) rather than 2 vCPU XenApp virtual machines (with more users per VM). From my own experience and what I got from the community, the performance will be degraded if you use 2 vCPUs. As a mather of fact, during a session on this subject at VMworld 2008 in Las Vegas, this was what stated:

> _&#8211; Always set up your Citrix VMs with 1 vCPU  
> &#8211; Due to the scheduling done by VMware at the hypervisor layer you will degrade performance if you use 2 vCPUs_

So having experienced it myself and read about it on the internet, there was no reason for me to try it differently on newer version of ESX. But after reading &#8220;VMware Platform Performance Index&#8221;, a benchmark performed by the guys over at <a title="VRC" href="http://www.projectvrc.nl/" target="_blank">Virtual Reality Check</a> (Ruben Spruijt and Jeroen van de Kamp), I got confused. <!--more-->

So what&#8217;s this document about?

> _The primary purpose of this whitepaper is to provide information about the scalability and best practices of virtualized Terminal Server and Virtual Desktop workloads using VMware ESX._

One of the conclusions regarding virtualizing a terminal server workload:

> _Using more than one virtual CPU per Terminal Server VM was generally not recommended. However, the tests in project VRC have proven that enabling two vCPU’s, allowed more much more users and gave a more consistent user experience._

Mmm, I must read further&#8230;

> _It is important to realize that the Terminal Server workload is unique. No other workload has so many active processes and threads within a single instance of Windows. Therefore, configuring only one vCPU per Terminal Server VM is not recommended._

It sounds quiet logical, but why is everbody saying: don&#8217;t use 2 vCPU Terminal server VM&#8217;s?

> _For long, it has not been a best practice to not enable more than one vCPU per Terminal Server VM. Interestingly, the tests in project VRC prove differently as long as the total amount of vCPUs in all VMs combined do not exceed the physical amount of CPU cores._

So I was thinking: how is this possible? Are these guys from Project VRC the first one to test this? Did something change between versions of ESX, so everyone is assuming now that 1 vCPU TS or Citrix VMs gives a better overall performance, while this is not true anymore with the latest ESX release? One thing I found that could have something to do with it, is something <a title="Yellow Bricks" href="http://www.yellow-bricks.com" target="_blank">Duncan Epping</a> wrote about a while back. It&#8217;s about what changed between ESX 2.x and ESX 3.x regarding &#8220;<a title="Multiple VM on ESX" href="http://www.yellow-bricks.com/2008/07/07/multiple-virtual-cpu-vms/" target="_blank">co-scheduling SMP VMs in VMware ESX Server</a>&#8220;. In short: ESX 2.x uses &#8220;strict coscheduling&#8221; whereas ESX 3.x uses &#8220;relaxed coscheduling&#8221;. Duncan&#8217;s explanation:

> _In other words VM’s with multiple vCPU’s don’t take up cycles anymore when these vCPU’s aren’t used by the OS. ESX checks the CPU’s for the idle proces loop and when it’s idle the CPU will be released and available for other vCPU’s. This also means that when you are using an application that will use all vCPU’s the same problems will still exists as they did in ESX 2.5._

As one of my customers wanted to test this to see if it improved user experience, I decided to give it a go and upgrade a XenApp VM with an extra vCPU. After initial testing, we decided to upgrade all XenApp VMs and put them in a seperate ESX cluster. I don&#8217;t have hard numbers, but the user experience improved noticeably. As this was only a small farm of 6 VMs, I do recommend to test this first, because user workloads can be different of course.

In conclusion:

&#8211; 2 vCPU terminal server (or XenApp) VMs allows more users and gives a more consistent user experience  
&#8211; Use dedicated hardware (ESX cluster) for the TS/XenApp VMs  
&#8211; Don&#8217;t overcommit total amount of vCPUs

I would love to hear your own experience and why you (don&#8217;t) use 2 vCPU XenApp or TS VMs, so feel free to comment!