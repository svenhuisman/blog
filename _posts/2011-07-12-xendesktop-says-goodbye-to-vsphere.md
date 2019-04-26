---
id: 2077
title: XenDesktop says goodbye to vSphere? (update 2)
date: 2011-07-12T21:44:53+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=2077
permalink: /2011/07/xendesktop-says-goodbye-to-vsphere/
image: /wp-content/uploads/2011/07/goodbye1.jpg
categories:
  - Virtual Desktop
tags:
  - License
  - VDI
  - VMware
  - vSphere 5
  - Xendesktop
---
In a lot of VDI deployments VMware vSphere is used as the hosting platform. There a couple of reasons that you can think of about why this is:

  * The company uses VMware vSphere as a platform for virtualizing their servers. They don’t want to manage other types of hypervisors for the VDI environment, so they want vSphere for their VDI as well.
  * VMware vSphere has multiple memory management technologies (TPS, ballooning, Memory compression) which work extremely well in an environment where the VM’s are very similar.
  * In case of VMware View, there is no choice of hypervisor, vSphere is the only option.

In case of Xendesktop deployments (or Quest vWorkspace or other VDI vendors that supports vSphere), VMware vSphere is often used because of the first two reasons. This may change this year, <del>unless VMware takes action</del>.

**UPDATE: I&#8217;ve just learned that VMware will release a Desktop edition of vSphere 5. This is very good news!** 

**&#8220;_A vSphere Desktop edition &#8211; This was quietly added on the partner SKU list for non-View VDI implementations.  This provides a low cost hypervisor for XenDesktop implementations (a fairly common occurance)._&#8221; (source: <a title="vSphere 5" href="https://knudt.net/vblog/post/2011/07/13/VMware-vSphere-5.aspx" target="_blank">Knudt Blog</a>)**

<!--more-->

Now with <a href="https://svenhuisman.com/2011/07/vsphere-5-whats-in-enterprise-plus-2/" target="_blank">vSphere 5, a new license model</a> is introduced. This new license model introduces “vRAM Entitlement”. An explanation:

> We have introduced vRAM, a transferable, virtualization-based entitlement to offer customers the greatest flexibility for vSphere configuration and usage. vRAM is defined as the virtual memory configured to virtual machines. When a virtual machine is created, it is configured with a certain amount of virtual memory (vRAM) available to the virtual machine. Depending on the edition, each vSphere 5.0-CPU license provides a certain vRAM capacity entitlement. When the virtual machine is powered on, the vRAM configured for that virtual machine counts against the total vRAM entitled to the user. An important feature of the new licensing model is the concept of pooling the vRAM capacity entitlements for all processor licenses. The vRAM entitlements of vSphere CPU licenses are pooled across all CPU licenses managed by a VMware vCenter instance.

What does this mean for Xendesktop deployments on vSphere? A couple of examples:

I need to host 500 Windows 7 desktop VMs on a cluster. Each VM needs 2 GB of vRAM. Suppose I can host 7 VMs per core and I use servers with 2 CPUs with 6 cores each. Per server I’m able to host 2\*6\*7= 84 VMs. Because of the memory technologies used in vSphere, I don’t need 84 x 2GB = 168GB RAM in each server, but 128GB RAM should be enough (I know, it depends, but it’s just an example). Using 6 of these servers, I’ll be able to host 504 VM’s.

  * Total number of VMs: 504 VM’s
  * Number of hosts: 6
  * CPUs per host: 2
  * Cores per CPU: 6
  * Memory per host: 128GB
  * Total amount of CPU sockets: 12
  * Total amount of vRAM needed: 504 x 2GB = 1008GB

The question is now: which vSphere 5 license do I need for my VDI hosts? I have three options and each option gives me the right to allocate a certain amount of vRAM per CPU socket:

  * vSphere Standard: 24GB vRAM per CPU socket
  * vSphere Enterprise 32GB vRAM per CPU socket
  * vSphere Enterprise Plus 48GB vRAM per CPU socket

Distributed Resource Scheduler (DRS) and Distributed Power Management (DPM) are features which are often demanded in a VDI environment. These are features that are part of the Enterprise and Enterprise Plus license. If I look at the number of CPU licenses I would need, I can calculate how much vRAM I can allocate. 12 x 32GB RAM = 384GB RAM. That’s not enough to host all of the VMs. Even when I take a vSphere Enterprise Plus license, I can only allocate 576GB of vRAM. In this situation, I need 32 vSphere Enterprise licenses or 21 vSphere Enterprise Plus license instead of just 12!

Now what will happen? There are a couple of options. Current Xendesktop deployments on vSphere will probably migrate to Hyper-V or Xenserver or will stay on vSphere 4 for as long as this platform is supported. New Xendesktop deployments will not even think of using vSphere 5. A side effect of this can be that the hosting platform of the servers will also be migrated to Hyper-V or Xenserver, because it isn’t an option to maintain 2 different types of virtualization platforms.

It still possible that VMware will offer a VDI-license which can be used for Xendesktop deployments. The same license is used with VMware View, which is a per concurrent user license for vSphere. This license is intended for desktop OS VMs only. <del>Time will tell if VMware will make this VDI-license available as a separate license (instead of only including it with VMware View).</del>

Update 2: there is now a [document published](https://mylearn.vmware.com/courseware/103763/vmLIVE_VMware_vSphere_Desktop_FAQ.pdf "vSphere 5 Desktop license") which explains about the vSphere desktop Edition. It&#8217;s $65 per powered-on desktop, you buy in 100 packs. Blogpost coming up with new calculations!

&nbsp;