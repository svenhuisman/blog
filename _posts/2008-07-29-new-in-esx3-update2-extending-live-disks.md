---
id: 120
title: 'New in ESX3 Update2: extending live disks'
date: 2008-07-29T07:51:17+02:00
author: Johan
layout: post
guid: https://svenhuisman.com/?p=120
permalink: /2008/07/new-in-esx3-update2-extending-live-disks/
categories:
  - Virtualization news
tags:
  - ESX
  - extending disk
  - VMware
---
After I upgraded my ESX test box from ESX3 update1 to update2 my Virtual WSUS server complained about lack of disk space. One of the improvements in Update2 would be extending disks on running machines, so I thought: &#8220;What the heck, a great chance to give that a try&#8221;.

So I went into the properties of the VM and specified a larger disksize for the WSUS download disk; the &#8220;New Size&#8221;  box was previously grayed out under Update1 now I could specify a larger size.

<!--more-->ESX went to work, within windows I did a rescan of the disk and immediately I saw the added space being added to the disk. Whow, now the extending part: I started a commandline, started Diskpart, selected the appropriate volume and gave the command &#8220;extend&#8221;. I instantaneously got the added diskspace to that partition.

Now WSUS is happy again with enough disk space to store its downloaded files. In a situation where there are separate SAN and ESX administrators this would be an advantage for Virtual Disks instead of Raw Disk Mappings (RDM) because the ESX administrator won&#8217;t have to go to the SAN administrator to ask for a larger LUN. This is one extra argument to choose for Virtual Disks !!!