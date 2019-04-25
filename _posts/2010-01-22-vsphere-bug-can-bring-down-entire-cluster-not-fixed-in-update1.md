---
id: 1579
title: vSphere bug can bring down entire cluster (not fixed in Update1).
date: 2010-01-22T15:44:13+02:00
author: Matthijs Haverink
layout: post
guid: http://virtualfuture.info/?p=1579
permalink: /2010/01/vsphere-bug-can-bring-down-entire-cluster-not-fixed-in-update1/
categories:
  - Virtual Infrastructure
tags:
  - bug
  - down
  - error
  - issue
  - jabber
  - LUN
  - Removal
  - SAN
  - update 1
  - VMFS
  - vSphere
---
**L**ast month I was on-site at one of my customers and experienced a major problem on the vSphere environment. We suddenly experienced about 150 virtual servers running on 16 hosts in 2 clusters (on the same SAN) going in jabber-mode. They froze, which made them unavailable for pings and other traffic. The freeze moment varied from 1 to 30 seconds. After that the VM&#8217;s went back on-line again. This seemed to happen in groups of about 10 to 30 VM’s.

**P**retty soon we saw in the logs that a VMFS LUN was removed by one of the SAN administrators. This LUN was still attached to all the ESX hosts in that cluster but was not “in use”, meaning, there were no VM’s running on it.

**O**ff course the unclean removal on SAN-level of a LUN before detaching it from the ESX hosts is not the way to do this but that what I just described shouldn&#8217;t have happend!

**T**he quick solution was <!--more-->to do a storage rescan which removed the link to the unavailable LUN and after a couple of minutes the environment was stable again.

**I**n the beginning I couldn’t believe that the LUN removal was the cause of the problems we had but at the end I had reactions on twitter of people confirming the same problems in the same situation. Also, after investigation, VMware confirmed that this was a known “feature” of VMware vSphere.

**N**ow you might think: just upgrade to Update 1 and probably all problems will be fixed: NOT! VMware confirmed that this issue is not fixed in Update 1 and no patch will be released unless more customers experience this problem.

**S**omewhere I understand this reaction: it occurs when you don’t handle your VMware environment as VMware prescribes but when you see what can happen to your production environment I would like to see this issue fixed a.s.a.p.

**I** also noted that I&#8217;m not the only one that has experienced this problem ( <a href="http://communities.vmware.com/thread/251536" target="_blank">http://communities.vmware.com/thread/251536</a> ) so I&#8217;m curious if VMware will pick this up before Update 2 or not.

**F**or now I&#8217;d like to hint you : triple-check every storage change you do when it concerns vSphere!