---
id: 109
title: Enhanced VMotion capabilities in VMWare VI Update 2
date: 2008-07-27T09:04:40+02:00
author: Matthijs Haverink
layout: post
guid: http://virtualfuture.info/?p=109
permalink: /2008/07/enhanced-vmotion-capabilities-in-vmware-vi-update-2/
categories:
  - Virtualization news
tags:
  - Enhanced VMotion Capability
  - EVC
  - Infrastructure
  - Matthijs Haverink
  - VMotion
  - VMware
---
**Last week** <a href="http://www.vmware.com" target="_blank">VMWare</a> released the long expected Update 2 for the VMWare 3 Infrastructure products. Besides cool new features like Hot-cloning VM&#8217;s, W2K8 Guest support, Storage VMotion and VSS quiescing support, one of the <a href="http://www.vmware.com/support/vi3/doc/vi3_esx35u2_vc25u2_rel_notes.html#whatsnew" target="_blank">new features</a> is the so called **_EVC_**.

**This is introduced** as just another feature in the VMWare Infrastructure product line but this should not be taken lightly. EVC stands for Enhanced VMotion Capability and it is a technology which <!--more-->can be used to add support to an existing VMotion cluster.

**This technique** uses the **_Intel FlexMigration_** and **_AMD-V Extended Migration_** techniques to make their CPU&#8217;s compatible with older CPU versions within your EVC cluster. You can enable EVC on a cluster in VirtualCenter wich then configures all hosts in the cluster to ensure CPU compatitbility for VMotion.

Read all about the new features and bug fixes here:

<a href="http://www.vmware.com/support/vi3/doc/vi3_esx35u2_vc25u2_rel_notes.html#whatsnew" target="_blank">http://www.vmware.com/support/vi3/doc/vi3_esx35u2_vc25u2_rel_notes.html#whatsnew</a>