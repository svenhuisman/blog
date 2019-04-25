---
id: 1274
title: Change Microcode in Xenserver/Everrun
date: 2009-07-03T18:22:22+02:00
author: Matthijs Haverink
layout: post
guid: http://virtualfuture.info/?p=1274
permalink: /2009/07/change-microcode-in-xenservereverrun/
categories:
  - Virtual Infrastructure
tags:
  - Citrix
  - everrun
  - marathon
  - microcode
  - xenserver
---
Up until today I even didn&#8217;t know what Microcode or what it&#8217;s purpose was. After today I&#8217;ve learned a lot about it and would like to share it with you.

 &#8220;**Microcode** is a layer of lowest-level instructions involved in the implementation of [machine code](/wiki/Machine_code "Machine code") instructions in many computers and other processors&#8221; is the description from Wikipedia. I read more and normally the microcode is updated by using a BIOS upgrade or ROM Flash from your vendor (In my case Intel).<!--more-->

Why was I updating this? Because I was updating my Marathon Everrun version from 4.0.2 to 5.0.0 to add Level 3 Fault tolerance. And after the upgrade I couldn&#8217;t protect my machines with level 3 protection because of the out of date microcode. So my logical next step was to update my BIOS. After updating my bios through the linux tool provided by HP I rebooted the server and still got the error message. So my Microcode still hadn&#8217;t been updated.

After a long and hard search I found out that for Example ESX and some Linux versions update the microcode during the boot sequence by placing a microcode.dat file within the /etc/firmware folder on the root of the server. But of course this folder doesn&#8217;t exist on a XenServer (Would have been to easy). So I started looking for a microcode.dat and found it on the server directly in the root of the /etc folder. I renamed the file to microcode.dat.old en placed my microcode .dat (provided by Intel) in the root of the  /ETC folder.

Rebooted the server this did the trick. Good Luck