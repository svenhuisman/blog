---
id: 714
title: ESX (whitebox) local storage perfomance tip
date: 2009-02-02T22:12:15+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=714
permalink: /2009/02/esx-whitebox-local-storage-perfomance-tip/
categories:
  - Virtual Infrastructure
tags:
  - ESX
  - ESX 3.5
  - esxi
  - HP P400
  - performance
  - RAID
  - VMware
  - Whitebox
---
I&#8217;ve been playing around with my ESX whitebox lately and I had a problem with the write performance of the local storage. Fortunately, I found a solution that I wanted to share. It can be useful for your ESX whitebox or even your production server.<!--more-->

First of all, here are the specs of my whitebox:

Mainboard: Abit IP35 PRO  
Processor: Intel Core 2 Duo E8400  
NIC: Intel PRO/1000 G T Desktop Adapter  
RAM: 2x Kingston KVR800D2N5K2/4G,4096MB, DDR2, PC6400 (total 8GB)  
RAID controller: HP P400 with 256 cache  
HD&#8217;s: 4x 500GB SATA

The first problem I encountered was the mainboard I initially bought (GigaByte GA-EP45-DS3) didn&#8217;t recognize the RAID controller. It had 2 PCI-express slots but it appeared that both were meant for VGA. So first check on the internet if you decide to use a server RAID-controller on a desktop mainboard. The card you have in mind may not work with your mainboard.

The second problem I had was having a bad RAM module. I&#8217;ve blogged about <a title="bad memory" href="https://svenhuisman.com/2008/11/esx_badmemor/" target="_blank">that issue before</a>.

The third problem was the fact that my mainboard did not recognize my processor correctly. I picked a duocore because I figured I would run 8-10 VM&#8217;s max. That&#8217;s a 4-5 to 1 CPU-core. It turned out I have a E0 stepping which my mainboard apparently did not support. Therefor I could not enable VT. Fortunately, I found a beta bios update for my mainboard. After flashing the mainboard (it was hard to find a floppy drive and floppy, I can tell you that), everything was ready to run ESXi 3.5 U3 from an USB-key.

Everything looked OK. I installed vCenter server as a VM, couple of domain controllers, fileserver, terminal server gateway (to remote control my VM&#8217;s securely over HTTPS) and a couple more. I noticed the write speed on the VMFS volume hosted by the P400 RAID controller would not go beyond 9 MB/sec (red circle). That&#8217;s odd, I thought. I have 256 MB cache, so why is it not using it? I also have a single SATA disk connected to the onboard ICH9 controller. This single disk is getting write performance of 50 MB/sec (blue circle).

[<img class="aligncenter size-medium wp-image-717" title="write1" src="https://svenhuisman.com/wp-content/uploads/2009/02/write1-300x66.jpg" alt="" width="300" height="66" />](https://svenhuisman.com/wp-content/uploads/2009/02/write1.jpg)

I did some research and it turns out the HP P400 RAID controller disables the cache for write when there is no battery backup unit connected to the cache and there is no way to turn it on except connecting a battery to the cache. Apparently there are some more vendors that disables the write cache when there is no battery present. It&#8217;s pretty logical, because when you have a hardware failure during a write on disk, data could get corrupted. But for us techies, it would be nice to enable write cache on our test-environment.  
I ended up buying a battery backed write cache enabler for my RAID controller and I don&#8217;t regret it: write performance of 150 MB/sec!

[<img class="alignleft size-medium wp-image-716" title="write2" src="https://svenhuisman.com/wp-content/uploads/2009/02/write2-300x67.jpg" alt="" width="300" height="67" />](https://svenhuisman.com/wp-content/uploads/2009/02/write2.jpg)

 

 

In conclusion:

If you want decent write performance on your ESX-whitebox, you should:  
A) Buy a RAID-controller with battery backed write cache.  
B) Buy a RAID-controller on which you can enable write back cache without the need of a battery.

In both cases, do a search on the web if the RAID controller will work on your mainboard.

I&#8217;m curious what write performance you get on your ESX whitebox and with what setup.