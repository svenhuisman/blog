---
id: 1663
title: ThinApp licensing
date: 2010-02-10T13:56:14+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=1663
permalink: /2010/02/thinapp-licensing/
categories:
  - Virtual Applications
tags:
  - Application Virtualization
  - Thinapp
  - VDI
  - View
  - VMware
---
Yesterday during VMware vForum I was asked how <a title="ThinApp" href="http://www.vmware.com/products/thinapp/" target="_blank">ThinApp</a> was licensed. I did know that ThinApp was licensed per device. But what does that mean, per device? What if I use the ThinApped applications on Citrix XenApp servers, do I have to pay a license per Citrix XenApp server? What if I put the ThinApp license on a USB-device?<a title="ThinApp licensing" href="http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1006248" target="_blank"> This knowledgebase article</a> is clear about ThinApp licensing:

  * VMware licenses ThinApp on a per-device basis.<!--more-->

  * The term device encompasses client hardware devices including PC computers, laptops, mobile devices, workstations, terminals, external media drives including flash USB.
  * To run a ThinApp package means using, accessing, displaying, running, copying or installing the product, regardless of the medium of access to the product.

However, if you consider to use VMware View as well as ThinApp, and you buy the <a title="VMware View" href="http://www.vmware.com/products/view/" target="_blank">VMware View Premier suite</a> (which includes a ThinApp license), ThinApp is licensed per concurrent desktop usage basis (from <a title="View support FAQ" href="http://www.vmware.com/files/pdf/view_pricing_support_faq.pdf" target="_blank">this support FAQ</a>):

> _ThinApp is licenses on a per device OR concurrent desktop usage basis when purchased as part of the View bundles or standalone._

A couple of scenario&#8217;s are also explained in the <a title="ThinApp licensing" href="http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1006248" target="_blank">knowledgebase article</a>.

  * Scenario 1: Physical PCs and Laptops
  * Scenario 2: Virtual PCs in a VDI scenario
  * Scenario 3: Portable Media drives (USB flash devices)
  * Scenario 4: Streaming ThinApps into memory on physical or virtual PCs