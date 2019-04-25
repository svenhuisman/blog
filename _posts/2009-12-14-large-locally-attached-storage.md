---
id: 1593
title: Large locally attached storage
date: 2009-12-14T10:27:15+02:00
author: Johan
layout: post
guid: http://virtualfuture.info/?p=1593
permalink: /2009/12/large-locally-attached-storage/
categories:
  - Virtual Infrastructure
tags:
  - ESX
  - VMware
  - vSphere
---
We all know that ESX supports LUNs / Disks up to 2TB (minus a few kb) but what happens when a larger locally attached disk is connected to a host?

This is what  I have noticed when I tried to create a large volume on my own ESX white box with more than 2TB locally attached storage: it only allowed me to create a volume with the space above the 2TB. In my situation I got a 48 GB volume on a 2048 GB LUN. Also, this &#8220;2TB&#8221; volume, which I created with the vmkfstools commandline utility, was useless because I could not create a single VM on it.<!--more-->

Ok here&#8217;s my setup: a RAID5 set with 3 x 7.5GB and a hotspare with a LSI Logic 8408E SAS Controller which gives me a disk of approx. 2048GB. 

One should expect that ESX creates a volume of 2TB and disregards the rest or allows you to create an additional volume but that&#8217;s not the case.

How I worked around this strange behaviour? Within the RAID controller application I created a Virtual Drive with a capacity less that 2TB. I know for sure that the LSI adapters use this feature but other adapters my incorporate a similar feature. An other option was to create a RAID set less than 2TB for this obvious reason. I ended up with 2 Virtual Disks stripped accross the RAID5 set each a little over 1TB in size thus eliminating the problem.

These problems hardly exist on shared storage because we just create a new LUN and then create a VMFS volume on it, but with the current large 1 and 2TB disks it will be easier to create very large locally attached storage.