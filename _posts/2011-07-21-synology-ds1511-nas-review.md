---
id: 2154
title: Synology DS1511+ NAS Review
date: 2011-07-21T21:47:14+02:00
author: Matthijs Haverink
layout: post
guid: https://svenhuisman.com/?p=2154
permalink: /2011/07/synology-ds1511-nas-review/
image: /wp-content/uploads/2011/07/ds1511_face_1024.jpg
categories:
  - Storage
tags:
  - Cisco NSS324
  - comparison
  - features
  - Hyper-V
  - Iomega IX4-200d
  - Netgear ReadyNAS Ultra 6
  - performance
  - QNAP TS-859U-RP+
  - review
  - Synology DS1511+
  - VMware
  - xenserver
---
**T**his is the sixth post in the [_**SMB/LAB NAS review**_](https://svenhuisman.com/2011/07/smblab-nas-review/). The entire review compares the following products on features and performance:

**&#8211; [Cisco NSS324](https://www.cisco.com/en/US/products/ps10854/index.html)  
** &#8211; **[Iomega IX4-200d](https://iomega-eu-en.custhelp.com/app/answers/detail/a_id/22024)  
** &#8211; **[Netgear ReadyNAS Ultra 6](https://www.netgear.com/home/products/storage/work-and-play/RNDU6000.aspx)  
** &#8211; **[QNAP TS-859U-RP+](https://www.qnap.com/pro_detail_feature.asp?p_id=185)  
** &#8211; **[Synology DS1511+](https://www.synology.com/products/product.php?product_name=DS1511%2B&lang=enu)**

**T**oday I describe my experiences with the [Synology DS1511+](https://www.synology.com/products/product.php?product_name=DS1511%2B&lang=enu)**.** This unit is one of the heaviest prosumer models of Synology and is fitted with 5 drive bays. The unit looks nice, is quiet (of course depending on the disks you use) and is just like the QNAP, packed with features.

<!--more-->

**Synology DS1511+ Basics:**  
_\# Disks : 5_  
_\# Hot swappable: Yes_  
_\# CPU : Intel Atom 1,8 Ghz Dual Core_  
_\# RAM : 1 GB DDR2_  
_\# Protocols : NFS, CIFS, iSCSI, AFB/Bonjour_

**A**s mentioned before the Synology DS1511+ has 5 bays that are easily lockable and unlockable (if you have fingernails). One nifty advantage of the Synology is that it has 1 HDD led per disk so you can effectively see which disk is busy. For the average user not important; for a prosumer that wants to know what’s going on; it can help. There’s one thing that really makes this Synology unique compared to all other units: it can be extended with two 5-bay units. These are the DX510 units; they [<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; margin-left: 10px; margin-right: 10px; padding-top: 0px; border: 0px;" title="image" src="https://svenhuisman.com/wp-content/uploads/2011/07/image_thumb4.png" border="0" alt="image" width="244" height="191" align="right" />](https://svenhuisman.com/wp-content/uploads/2011/07/image4.png)have little intelligence  and are connected via eSATA. This means that you can get this unit to address 15 disks of 3 TB = 45 TB!

**T**his directly raises 2 questions:  
1. If you need 45 TB; is this the type of solution you’re looking for ?  
2. If you really have 15 drives you have to address; is this device really up for the job, or does it bring down performance ?

**T**he memory of the unit is 1 GB by default but can be expanded to 3 gigs. Maybe the memory expansion option is related to managing the optional DX510 units but my feeling says that these bays ask for more CPU power. And although the unit is equipped with a dual core 1.8 Ghz Atom CPU I’m still a bit sceptic about this thing really performing with 45TB in it. Maybe a nice test for in the future…

**A**nother thing that really needs to be mentioned is the next generation management <del>software</del> Operating System on the Synology. With DiskStation Manager 3.1 Synology really is a step ahead of competition when it comes down to the management of the device. DSM isn’t just a webpage where you do your settings; it’s an web-based OS; it’s got the look and feel of an OS, but a very lean and mean one. And one of the most powerful features: the search field; you don&#8217;t have to navigate through tons of menu structures to find anything; just type in what you want to configure and the search function gets you there instantly! I’ve included a screenshot in here but you should really take a look at this video to see DSM in action: <https://www.youtube.com/watch?v=0QcpGnW74Qc>.

[<img class="alignleft size-medium wp-image-2169" style="margin-left: 1px; margin-right: 1px;" title="Synology DSM Screenshot" src="https://svenhuisman.com/wp-content/uploads/2011/07/synology_dsm_screenshot-350x230.png" alt="" width="267" height="157" />](https://svenhuisman.com/wp-content/uploads/2011/07/synology_dsm_screenshot.png)**S**ynology, just as QNAP, has a portal where they deliver out-of-the-box packages you can install onto your Synology NAS to really benefit from the CPU and memory resources inside. It needs to be said that Synology doesn’t have such a packed set of “apps” as QNAP does. For SabNZBd for example, you have to search a little further; this isn’t deliverd by Synology themselves (although <a href="https://www.mertymade.com/syno/" target="_blank">the alternative</a> works like a charm).

**S**ynology also has an intelligent and easy RAID configuration system, just like, for example Netgear, called Synology Hybrid RAID. This gives you the option to dynamically expand and manage your disks in almost any thinkable RAID configuration.

**A**nd then of course the performance. Details will be revealed in the next posts but the Synology really is capable of getting beyond the 100 MB/s limit. In fact; my limited test lab, with just a 1 GB network connection, appeared to be the bottleneck in some tests.

**O**verall it&#8217;s, just like the QNAP, a device that I can find little to complain about, which wasn&#8217;t really unexpected; QNAP and Synology are leading this market for a while now and still improving stability and feature set. Pro&#8217;s and con&#8217;s of the DS1511+:

**+ Next Gen Interface  
** **+ Feature packed  
+ Great performance**

**&#8211;  Small “app store”**

**STAY TUNED:** Since this isn’t all; next week we’ll present to you a feature comparison and some performance indicators and of course the general conclusion.