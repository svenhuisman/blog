---
id: 1519
title: Introduction to Vmware View 4
date: 2009-11-16T23:16:29+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=1519
permalink: /2009/11/introduction-to-vmware-view-4/
categories:
  - VDI Blog Battle
  - Virtual Desktop
tags:
  - Desktop Virtualization
  - PCoIP
  - VDI
  - View 4
  - VMware
---
This week VMware will release VMware View 4, “the industry’s first purpose built solution for delivering desktops as a managed service” as VMware calls it. I don’t know about that, but at least this release is a step in the right direction. The 2 big improvements View 4 brings are the new display protocol PCoIP and support for VMware vSphere. In this blogpost, I will describe the features, the components and what’s missing.<!--more-->

**What is VMware View?**

A couple of years ago, VDI was a concept of running virtual desktops in the datacenter and users connecting to those virtual desktops. Nowadays, VDI is more than that, much more. VDI is about delivering a desktop to a user, including (virtual) applications and maintaining user settings, providing a high user experience. It doesn’t matter if the desktop is running in the datacenter as a virtual machine or a blade-PC, it can also run on the user’s desktop.

VMware View 4 has taken a step in that direction. I want to say “big step”, but unfortunately View 4 is still lacking a couple of important features. I will come back to this at the end of this post. So what is View 4? According to VMware: 

_“VMware View 4 is a solution that enables IT organizations to “decouple” a desktop from physical devices or locations and deliver the desktop as a managed service from a centralized location.”_

Let’s take a quick look at the features of View 4. First of all: the support for VMware vSphere. It’s funny when you think of it, VMware is the last VDI-vendor to support VMware vSphere (BTW, VI 3.5 is also still supported). The second big feature is PCoIP, the software implementation of Teradici’s display protocol PCoIP. This display protocol is supposed to give a superior User Experience, LAN and WAN.

<img class="aligncenter size-thumbnail wp-image-1530" title="PCoIP" src="https://svenhuisman.com/wp-content/uploads/2009/11/PCoIP-200x200.png" alt="PCoIP" width="200" height="200" srcset="https://svenhuisman.com/wp-content/uploads/2009/11/PCoIP-200x200.png 200w, https://svenhuisman.com/wp-content/uploads/2009/11/PCoIP-250x250.png 250w, https://svenhuisman.com/wp-content/uploads/2009/11/PCoIP-75x75.png 75w" sizes="(max-width: 200px) 100vw, 200px" /> 

Below the rest of the new or improved features in View 4 are listed: 

  * Quad monitor support
  * True multi-monitor support on L-shape configuration
  * Guest desktop support Windows Vista and XP OS
  * Network characteristics and security
  * Protocol intelligence
  * WAN performance and optimization
  * VPN tunneling
  * RDP virtual channel compatibility for USB redirection
  * Flash control support for PCoIP
  * Audio redirection
  * ClearType font
  * Triple single sign — on (3SSO) for sessions/connections keep-alive
  * Tag-based pool access
  * Smart card removal policy
  * Delete script 

Please check the Evaluation guide for more details (you can download this when you <a title="Register for View 4" href="https://www.vmware.com/tryvmware/?p=view4&lp=1" target="_blank">register for an evaluation</a>). Also don’t forget ThinApp is included in the Premier licensed version.

**Components **

VMware View 4 extends the same infrastructure and components as in previous versions. The key software components you need to install VMware View 4 are:

  * VMware View Connection Server, installed in a Windows Server 2003 system that is separate from VMware vCenter™
  * VMware View Agent, installed in a virtual desktop (XP, Windows 2003, or Vista desktops)
  * VMware View Client, installed at the end point device (thin client, local laptop or desktops)
  * VMware View Composer, installed in VMware vCenter for Linked Clone provisioning use 

Basically, the user connects to the View connection server with the View client. The View agent is installed in the virtual desktop and is registered with the View connection server. View composer is used for linked-clones (a golden-image virtual desktop and the new desktops (clones) are just the delta-files, linked to the golden-image).

**What’s missing?**

As I stated before, VMware View 4 still lacks a couple of important features:

  * Windows 7 is experimental supported. You will have to wait until 2010 Q1 until Windows 7 support with View and ThinApp.
  * Offline desktop is still an experimental feature.
  * No user profile management. During VMworld VMware announced a license agreement with RTO software. Unfortunately, it did not make it into this version.
  * View manager UI is webbased. No integration in vCenter server (yet).
  * No ThinApp integration into View Manager.
  * When using PCoIP, some features are not available: no ThinPrint, security server or smartcard. 

When VMware fixes these limitations AND integrate the upcoming Client Virtualization Platform (CVP) with VMware View, this can be a real solution for delivering a desktop as a managed service. More about CVP in an upcoming blogpost, but the way I see it, the solutions for providing  a virtual desktop environment are getting better and better, but it’s just the beginning.