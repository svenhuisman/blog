---
id: 1696
title: VMware View 4.5 Expected Features
date: 2010-05-19T08:30:54+02:00
author: Matthijs Haverink
layout: post
guid: http://virtualfuture.info/?p=1696
permalink: /2010/05/vmware-view-4-5-expected-features/
categories:
  - Virtual Desktop
  - Virtual Infrastructure
  - Virtualization news
  - Workspace Management
tags:
  - BYOC
  - Client Hypervisor
  - entitlement
  - expected
  - features
  - local mode
  - off-line VDI
  - Thinapp 4.5
  - tiered storage
  - View 4.5
  - VMware
  - VMworld 2010
---
**[<img class="alignleft size-full wp-image-1364" title="newlogovmware" src="https://svenhuisman.com/wp-content/uploads/2009/09/newlogovmware.jpg" alt="" width="79" height="21" />](https://svenhuisman.com/wp-content/uploads/2009/09/newlogovmware.jpg)Y**esterday I had a presentation (not under NDA) from VMware about the improvements and features that we can expect with View 4.5 (no guarantees) and I was impressed as well as disappointed.  Impressed by the small additions/improvements that together create a more mature and complete Desktop Virtualization solution. Disappointed about the fact that the feature that really drew my attention : Virtual Profiles (the <a href="http://www.rtosoft.com/" target="_blank">RTOSoft</a> acquisition) has some big disadvantages which gives me the feeling I still need a “real” Profile Virtualization solution.

It’s my personal guess, not mentioned by VMware, that View 4.5 will be released at <a href="http://www.vmworld.com" target="_blank">VMworld 2010</a> San Fransisco in August 2010.

First thing: the **client hypervisor**. <!--more--> There’s been a lot of buzz about View 4.5 and the client hypervisor that would be in or out. It’s pretty clear that VMware won’t release its client hypervisor with View 4.5. I think it shows by the sales strategy they seem to choose as you can read in 

<a href="http://www.brianmadden.com/blogs/brianmadden/archive/2010/05/04/vmware-delays-the-launch-of-view-4-5-too-much-focus-on-the-client-hypervisor-which-has-been-cut-perhaps.aspx" target="_blank">Brian Madden’s post</a>. And its not that I’m falling for the sales blabla of VMware but I don’t really see the value of the client hypervisor for business needs at this moment. I see it being used in BYOPC concepts but especially for the Dutch market, where Bring Your Own PC concepts aren’t really common mainly because of legal/tax related issues, I find it hard to come up with a good use case.

<span style="text-decoration: underline;">Then</span>** <span style="text-decoration: underline;">Virtual Profiles</span>**: finally VMware starts completing the View product with features that are unbearable in a Desktop Virtualization scenario. With Virtual Profiles VMware offers a technique that “detaches” your Windows profile from the OS. It works nice but if I understand it correctly it is still very much based on the roaming profiles technology of Windows itself. And the biggest downside : since it depends so much on the profiling technique of Windows itself it needs different profiles for Windows XP (profile v1) and Windows Vista/7 (profile v2). So this won’t help you migrate from XP to Windows 7 since all user settings will be lost! And that is a real killer when you ask me… Desktop Virtualization projects are often combined with a Desktop OS upgrade and if this is the case you still need a third party product from a party like <a href="http://www.immidio.com" target="_blank">Immidio</a>, <a href="http://www.appsense.com" target="_blank">AppSense</a>, <a href="http://www.ressoftware.com" target="_blank">RES</a>, <a href="http://www.scense.nl" target="_blank">Scense</a> etc.

And the inflexibility between desktop Operating Systems isn’t the only downside. The Virtual Profiles solution is a VMware View only solution. So if you switch to a VMware View solution for 100% of your desktops it might be a good solution. But wake up; VDI is perfect in certain use cases but in the majority you will have local desktops and/or terminal servers in your environment too. What about them? How do you manage user profiles in those environments?

Well enough negativity; there are some pretty cool improvements that all together create a pretty mature solution:

&#8211;          **“Local Mode” : off-line VDI finally** out of experimental phase. There is also a new role in this scenario: the Transfer Server.

&#8211;          **ThinApp 4.5 with Application Entitlement** (assign applications to Desktop Pools; MSI only)

&#8211;          **Tiered Storage** : define different datastores for different datatypes (replica’s, userdata etc.) <- great feature !

&#8211;          **Full Sysprep support**

&#8211;          **Disposable Disk technology** (ability to identify Temp/Swap data in your image and clean that data automatically).

&#8211;          **Snapshot support for Linked Clones** (Floating Pool)

&#8211;          **Role Based Administration**

&#8211;          **Kiosk Mode Desktop Pools** (GUI suppression and device-based assignments)

&#8211;          **Native MacOS client**

&#8211;          **Web Download Portal** (for downloading the client software via the web)

&#8211;          A good dashboard with more event logging for **better troubleshooting**

In general all the interfaces look better because of the use of <a href="http://www.adobe.com/products/flex/" target="_blank">Adobe Flex</a>. Adobe Flex is the new standard for VMware management consoles. And yes: a standard also means that in the future we can expect seamless integration of different management consoles from View and vCenter for example!

All together I think VMware is making a big step with View 4.5 and it really starts to compete with the more mature Citrix XenDesktop solution!