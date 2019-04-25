---
id: 588
title: 'VMware introduces View Composer: EMC not happy?'
date: 2008-12-02T23:18:00+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=588
permalink: /2008/12/vmware-introduces-view-composer-emc-not-happy/
categories:
  - Virtual Desktop
tags:
  - Composer
  - EMC
  - vCenter
  - VDI
  - View
  - VMware
---
Today VMware introduced a name change and a new product suite. _VMware View_ and _VMware vCenter <**old product name**>_. A lot of bloggers already reported this news, so I won&#8217;t go into this a lot. Just pick on of the following to read all about it:

  * <a title="VMTN" href="http://blogs.vmware.com/vmtn/2008/12/do-they-smell-a.html" target="_blank">John Troyer</a>
  * <a title="NTpro.nl" href="http://www.ntpro.nl/blog/archives/785-VMware-Product-Name-Changes.html" target="_blank">Eric Sloof</a>
  * <a title="Thinappblog" href="http://edwinfriesen.nl/content/?p=128" target="_blank">Edwin Friessen</a>
  * <a title="VMETC" href="http://vmetc.com/2008/12/02/vmware-changes-product-names/" target="_blank">Rich Brambley</a>
  * <a title="Yellowbricks" href="http://www.yellow-bricks.com/2008/12/02/whats-in-a-name/" target="_blank">Duncan Epping</a>
  * <a title="itknowledgeexchange" href="http://itknowledgeexchange.techtarget.com/virtualization-pro/vmware-product-name-changes-vcenter-view/" target="_blank">Eric Siebert</a>

What&#8217;s more interesting is that VMware View Manager 3 together with VMware View Composer is released.<!--more-->VMware View Composer is the technology also used in 

<span style="text-decoration: line-through;">VMware Lab Manager</span>, excuse me, VMware vCenter Lab Manager that enables the use of linked-clones or golden master image. This means that an administrator can install a virtual machine with a desktop OS and use that image to deploy other virtual desktops. It works like this:

  * Create a snapshot of the golden desktop VM
  * Use VMware View Manager to create a new pool of desktop VMs
  * A replica is created of this snapshot. The newly created VMs will have a pointer to this replica and only the changes (delta&#8217;s) will be written to a delta-vmdk
  * Quickprep takes care of PC name and domain-membership

Because the diskfile&#8217;s of the virtual desktops only contains the delta&#8217;s written to disk, these vmdk&#8217;s are a lot smaller. You can have hundreds, maybe thousands of virtual desktops, with only a fraction of the actual diskspace used. I don&#8217;t know what this does to your I/O performance but the linked-clones are attached to a replica, not directly to the golden desktop image. So you can have multiple replica&#8217;s to spread the load.

In the title of my post I questioned if EMC is happy with View Composer. Of course, EMC will not directly notice a drop in selling storage, but this &#8220;new&#8221; technology has great potential for the future. Imagine that you (can) use this technology for all your virtual machines, not just your virtual desktops. Together with &#8220;Thin provisioning&#8221; (enables the use of thin disks, vmdk&#8217;s that are not pre-allocated. Available with next release of VMware ESX or through commandline in <a title="Thin provisioning" href="https://svenhuisman.com/2008/11/vm-template-best-practice/" target="_blank">ESX 3.5</a>) this will save a lot of diskspace on your expensive storage. And we all know that 80% of our data is not activly used so that can be stored on cheaper storage :-).

BTW: Currently, Thin provisioning can not be used together with a View Composer image.