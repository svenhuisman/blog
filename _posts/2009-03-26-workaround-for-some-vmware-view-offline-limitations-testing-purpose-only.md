---
id: 1076
title: Workaround for some VMware View Offline limitations (testing purpose only!)
date: 2009-03-26T16:40:23+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=1076
permalink: /2009/03/workaround-for-some-vmware-view-offline-limitations-testing-purpose-only/
categories:
  - Virtual Desktop
tags:
  - Offline VDI
  - Thinapp
  - View
  - Virtual Desktop
  - VMware
  - VMware View 3.0.1
---
I wanted to test the VMware View Offline desktop. I know it has some limitations at the moment and that it is still an experimental feature. But still, I wanted to be able to show a customer the capabilities that VMware View already has in the current release, whether it is an experimental feature or not. I managed to work around some of the limitations and in this post, I explain how.<!--more-->

According to the VMware <a title="VMware View Admin guide" href="http://www.vmware.com/pdf/viewmanager3_admin_guide.pdf" target="_blank">View admin guide</a> the current limitations for Offline desktop are:

  * <span style="color: #ff0000;">You cannot install View Client with Offline Desktop on any system that has the following applications installed:<br /> VMware ACE, VMware Player, VMware Server, VMware Workstation.</span>
  * <span style="color: #ff0000;">View Client with Offline desktop capabilities must be installed on Windows XP Professional SP2 or SP3.</span>
  * Guest OS can only be Windows XP Professional SP2 or SP3.
  * Offline desktop can be used with: 
      * Individual, non-persistent, VM&#8217;s managed by Virtual Center
      * Automated, persistent, non-linked clone VM&#8217;s
      * Manual, persistent, VM&#8217;s managed by Virtual Center
  * <span style="color: #ff0000;">View Client with Offline Desktop cannot be run on a virtual machine.</span>
  * View Client with Offline Desktop does not support the use of smart cards.
  * You cannot download a desktop to a system where the guest exceeds the capabilities of the host; the host system must be at least as capable as the guest in order to run the View Manager desktop.
  * You cannot download a desktop if another user is currently logged in to that desktop.
  * ESX supports two simultaneous desktop checkouts. ESXi supports five simultaneous desktop checkouts.
  * Host CD?ROM redirection is not supported.
  * When a desktop is checked out, NAT is used for network communications.
  * The MAC address of the offline system remains the same as its online equivalent.
  * As with RDP, you can copy and paste text between host and guest systems. However, you cannot copy and paste system objects such as folders and files between systems.
  * Local drives are automatically mounted on the guest system.
  * Once a desktop is checked out on a client system, any changes made within View Administrator to the desktop or desktop pool settings will only be applied after the  
    desktop has been checked in again.

 The limitations marked in RED where stopping me from testing out the Offline feature. as an IT-consultant, I have VMware Workstation on my notebook. So I couldn&#8217;t install the VMware View Client with offline desktop on my notebook. It does make sense, because the VMware View Client with Offline desktop contains a modified version of VMware player/ACE. So installing this while having another VMware product on my notebook could interfere with the View client. My colleague has Windows Vista on his notebook (the poor guy), so that wasn&#8217;t an option either. Final chance for me was to test it in a Virtual Machine with XP. I couldn&#8217;t install it, because the installer is aware of being installed on a VM.

Now here&#8217;s a crazy thought: why not use ThinApp to virtualize the VMware View Client with Offline desktop? I&#8217;m probably going to run into some problems, because kernel-drivers are involved, but I decided to give it a go anyway.

I needed a physical Windows XP SP2/SP3 machine to capture the installation of the VMware View Client with Offline desktop. Luckily, I recently installed XP on my EEE PC (which I use at home), so I used it to ThinApp the View Client. My netbook isn&#8217;t a clean PC, which is recommended for using ThinApp, but hey, what I&#8217;m trying isn&#8217;t supported either ;-).

At this stage you might wonder why I didn&#8217;t use my EEE PC to test the Offline desktop feature. Good question&#8230; I guess I&#8217;m to lazy to bring it with me to the office, even if it is only 1 KG. 😉

Anyway, after capturing the VMware View Client (I did this last night at home), I tested the ThinApped version today at the office on my notebook, which has VMware Workstation on it. The client started, I could logon and the first thing to do is to check-out a virtual desktop:

<p style="text-align: center;">
  <a href="https://svenhuisman.com/wp-content/uploads/2009/03/view-offline.jpg" target="_blank"><img class="aligncenter size-full wp-image-1077" title="view-offline" src="https://svenhuisman.com/wp-content/uploads/2009/03/view-offline.jpg" alt="view-offline" width="373" height="275" srcset="https://svenhuisman.com/wp-content/uploads/2009/03/view-offline.jpg 414w, https://svenhuisman.com/wp-content/uploads/2009/03/view-offline-350x258.jpg 350w" sizes="(max-width: 373px) 100vw, 373px" /></a>
</p>

That works! Now try it in a Virtual Machine with XP or Windows 2003&#8230; I can check-out a virtual desktop here as well! Great. Now wait until I can start it up&#8230;

First I tested the ThinApped Client in a Virtual Machine:

<p style="text-align: center;">
  <a href="https://svenhuisman.com/wp-content/uploads/2009/03/offline-error.jpg" target="_blank"><img class="aligncenter size-full wp-image-1083" title="offline-error" src="https://svenhuisman.com/wp-content/uploads/2009/03/offline-error.jpg" alt="offline-error" width="354" height="94" srcset="https://svenhuisman.com/wp-content/uploads/2009/03/offline-error.jpg 505w, https://svenhuisman.com/wp-content/uploads/2009/03/offline-error-350x92.jpg 350w" sizes="(max-width: 354px) 100vw, 354px" /></a>
</p>

What I expected: &#8220;Unable to open kernel device&#8221;. Well, at least I can test the _Check-out_ and _Check-in_ feature.

Next, I tested it on my notebook, which has VMware workstation installed as well. To my surprise, the Offline desktop booted and I could logon to the Offline desktop:

<p style="text-align: center;">
  <a href="https://svenhuisman.com/wp-content/uploads/2009/03/offlineworks.jpg" target="_blank"><img class="aligncenter size-full wp-image-1084" title="offlineworks" src="https://svenhuisman.com/wp-content/uploads/2009/03/offlineworks.jpg" alt="offlineworks" width="265" height="196" srcset="https://svenhuisman.com/wp-content/uploads/2009/03/offlineworks.jpg 414w, https://svenhuisman.com/wp-content/uploads/2009/03/offlineworks-350x258.jpg 350w" sizes="(max-width: 265px) 100vw, 265px" /></a>
</p>

I&#8217;m guessing the local installation of VMware Workstation has something to do with it, because the offline desktop uses a virtual NAT device and that is what comes with VMware Workstation. Also, when I stopped the NAT service of VMware Workstation, the offline desktop looses it&#8217;s network connection. So in the end, it all makes sense.

I haven&#8217;t tested it on Vista yet, but my guess is that if I install VMware Workstation, VMware Server, VMware player or VMware ACE first on Vista and then use the ThinApped version of the VMware View Client, I could probably use the offline feature as well.