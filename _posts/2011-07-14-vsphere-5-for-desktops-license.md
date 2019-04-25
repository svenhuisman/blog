---
id: 2087
title: vSphere 5 for Desktops license
date: 2011-07-14T16:29:59+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=2087
permalink: /2011/07/vsphere-5-for-desktops-license/
image: /wp-content/uploads/2011/07/happy.jpg
categories:
  - Virtual Desktop
tags:
  - VDI
  - VMware
  - vRAM
  - vSphere 5
  - vSphere for Desktops
  - Xendesktop View
---
Just within 2 days after my blogpost about <a href="https://svenhuisman.com/2011/07/xendesktop-says-goodbye-to-vsphere/" target="_blank">Xendesktop says goodbye to vSphere</a> on vSphere anymore with the new license model, VMware published a document which “introduces” the <a href="https://mylearn.vmware.com/courseware/103763/vmLIVE_VMware_vSphere_Desktop_FAQ.pdf" target="_blank">vSphere 5 for Desktops license</a>. This is the exact same license as a vSphere 5 Enterprise Plus license, only there is no vRAM limit, you’re only allowed to use it for desktop VMs and it is priced per powered on VM.

We are happy again<img class="wlEmoticon wlEmoticon-smile" style="border-style: none;" src="https://svenhuisman.com/wp-content/uploads/2011/07/wlEmoticon-smile.png" alt="Smile" /> 

What happens to the example I used before:

I need to host 500 Windows 7 desktop VMs on a cluster. Each VM needs 2 GB of vRAM. Suppose I can host 7 VMs per core and I use servers with 2 CPUs with 6 cores each. Per server I’m able to host 2\*6\*7= 84 VMs. Because of the memory technologies used in vSphere, I don’t need 84 x 2GB = 168GB RAM in each server, but 128GB RAM should be enough (I know, it depends, but it’s an example and pretty close to what I see in real environments). Using 6 of these servers, I’ll be able to host 504 VMs. For this calculation, let&#8217;s use 500 VMs.

<!--more-->

  * Total number of VMs: 500 VM’s
  * Number of hosts: 6
  * CPUs per host: 2
  * Cores per CPU: 6
  * Memory per host: 128GB
  * Total amount of CPU sockets: 12
  * Total amount of vRAM needed: 500 x 2GB = 1000GB

Before I knew about the vSphere for Desktop licensing model, I would need 32 vSphere Enterprise licenses or 21 vSphere Enterprise Plus license instead of just 12 vSphere 4 Enterprise licenses. Now with the vSphere for Desktop licensing model, I would only need 5 times a 100-pack of vSphere 5 for desktop licenses. To compare the costs with list prices (Support excluded):

  * 12 x vSphere 4 Enterprise = $ 34500,-
  * 32 x vSphere 5 Enterprise = $ 92000,-
  * 21 x vSphere 5 Enterprise Plus = $ 73395,-
  * 5 x 100-pack vSphere 5 for Desktops (Enterprise Plus) = $ 32500,-

Not bad at all! But I still have some questions.

First question: what happens to the current “non-View” VDI deployments on vSphere 4? Can I upgrade these licenses to vSphere 5 for Desktops?

Answer: NO! <img class="wlEmoticon wlEmoticon-sadsmile" style="border-style: none;" src="https://svenhuisman.com/wp-content/uploads/2011/07/wlEmoticon-sadsmile.png" alt="Sad smile" /> 

> “These customers will be migrated to corresponding vSphere 5 editions and not to vSphere 5 Desktop. vSphere Desktop is for customers who want to purchase new vSphere licenses for deploying desktop virtualization solution.”

These deployments might consider not extending the support contract on these licenses and buy new vSphere 5 for Desktop licenses, upgrade to vSphere 5 and buy extra licenses to comply with the vRAM requirements or use these licenses for backend services and buy new vSphere 5 for Desktop licenses. Alternatively, a migration to Xenserver or Hyper-V could take place.

Question: I need 550 concurrent licenses. Can I buy a 50-pack?

Answer: NO! You can only buy 100-packs. VMware View licenses which includes the vSphere for Desktop license can be bought by 10-packs. This is however for VMware View 4.6 with vSphere 4.1. There is no information available for the next release of VMware View. However, let&#8217;s say this stays the same for the next release of VMware View, you could buy a couple of 10-packs of VMware View. In some cases, this could be cheaper than buy a 100-pack of vSphere for Desktops and the vSphere license you get can also be used for other brokers.

Question: do I need a separate vCenter server for my VDI-hosts?

When I read the licensing whitepaper for vSphere 5, I read this:

> “Available pooled vRAM is equal to the sum total of vRAM entitlements for all vSphere licenses of a single edition, managed by a single instance of VMware vCenter Server or by multiple instances of VMware vCenter Server in Linked Mode.”

and this:

> “vRAM entitlements are pooled by vSphere edition. Therefore, a vRAM pool can be extended by adding vSphere licenses of the same edition.”

How I read this is that you can’t mix different licenses on a single vCenter server. I would think that you need a separate vCenter server for your VDI hosts.

Answer from VMware: &#8220;We find that most customers separate their desktop virtualization and server virtualization deployments and typically use different instances of vCenter.  VMware recommends the use of different vCenter instances for Desktop Virtualization.&#8221;

So it&#8221;s recommended, not required.

Question: what if I buy the vSphere 5 for Desktop now, but I want to use vSphere 4 for Desktops until Xendesktop (or Quest vWorkspace, or other VDI brokers) supports vSphere 5? This questions I had to ask myself today at a customer.

Answer: vSphere 5 Desktop can be downgraded to vSphere 4 Desktop (according to the answer given on <a title="VMware View blog" href="https://blogs.vmware.com/euc/2011/07/vsphere-desktop-licensing-overview.html" target="_blank">this blog</a>).