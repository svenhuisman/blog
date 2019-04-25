---
id: 347
title: 'VMworld 2008 &#8211; VDM 3.0 to be released this year !'
date: 2008-09-16T15:31:41+02:00
author: Johan
layout: post
guid: http://virtualfuture.info/?p=347
permalink: /2008/09/vmworld-2008-vmd-30-to-be-released-this-year/
categories:
  - VMworld 2008 Vegas
tags:
  - VDI
  - VDM
  - VMworld 2008
---
Yesterday me and my colleague were at the VMworld Lab VMware Desktop preview, this was about the new version 3.0. This version incorporates a lot of new and really cool features like offline VDI, SVI and personal disks. Although an exact date has not been mentioned it was clear that this beta product is pretty close to release and an expected release date could be as early as the end of November. <!--more-->

Offline VDI addresses the problem VDI faces with mobile users (hence the word offline), the technologies used comes from ACE and Workstation. A stripped down version of ACE is used to encrypt and maintain policies over the offline VDI so that an VM may expire when a user no longer is allowed to use the VM. The agent uses the checkin/checkout out method to transfer the delta files between the online and offline VM&#8217;s. The drawback is that the first a user checks out a machine the entire VM is downloaded to the laptop, after that only deltafiles are being transmitted.

SVI or Scalable Virtual Images (the actual name will probably be announced today) uses the Labmanager technology of a shared image. Snapshots can be made available to single or multiple users and thus have smooth transition of updates or upgrades. In the lab an upgrade from IE6 to IE7 has been done and the only thing a user has to do is logoff and after a short time (5 minutes or so, the final product will definitely be faster I was told) the user can logon again and the new IE was available.

Another cool feature of this version is that it&#8217;s possible to alleviate the roaming profile problem with shared image based deployments like Citrix&#8217; Provisioning Server, after all when a machine is rebooted all changes to the entire disk are gone. VMware addresses this by connecting a additional disk to the VM and redirecting the user profile to that disk, this disk is a personal disk and gets married over and over again to the machine the user logs on to. The version we used in the lab stored the additional disk where the virtual machine was located. Of course this is not what you want, because when you destroy the VM, the user-disk will also be deleted. In the final product you are able to select the location for the user-disk.

The last feature i would like to mention is the possibility to load balance Microsoft Terminal Servers without the need of round robin DNS, which is in my opinion not load balancing at all.

I must admit: I was pretty impressed by the solidity of this beta and expect it to be released very shortly. This is a very good answer to Citrix&#8217; VDI and XenApp solutions, although RDP will not be as suffisticated as ICA.