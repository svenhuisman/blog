---
id: 1876
title: 'Disappearing Virtual NIC &#038; VMX has left the building'
date: 2011-04-12T23:07:54+02:00
author: Matthijs Haverink
layout: post
guid: https://svenhuisman.com/?p=1876
permalink: /2011/04/disappearing-virtual-nic-vmx-has-left-the-building/
image: /wp-content/uploads/2011/04/Leftthebuilding.jpg
categories:
  - Virtual Infrastructure
tags:
  - "4.1"
  - disappeared
  - disappearing
  - esxi
  - HotPlug
  - humour
  - NIC
  - Virtual
  - VMware
  - VMX has left the building
  - vSphere
---
**I** know I&#8217;m not the first who noticed it, since this message is to be found in log files for years with ESX, but I still wanted to share this one:

[<img class="aligncenter size-full wp-image-1882" title="VMX has left the building" src="https://svenhuisman.com/wp-content/uploads/2011/04/VMXhasLeftTheBuilding.jpg" alt="" width="510" height="109" srcset="https://svenhuisman.com/wp-content/uploads/2011/04/VMXhasLeftTheBuilding.jpg 510w, https://svenhuisman.com/wp-content/uploads/2011/04/VMXhasLeftTheBuilding-350x74.jpg 350w" sizes="(max-width: 510px) 100vw, 510px" />](https://svenhuisman.com/wp-content/uploads/2011/04/VMXhasLeftTheBuilding.jpg)

Especially when you&#8217;re seriously troubleshooting an issue and this message appears, it&#8217;s a good laugh. Kudos to the VMware programmer with humour :).

**Back 2 Business: the missing/disappeared Virtual NIC**  
<!--more-->

This was a new one for me so I&#8217;d like to share this one.

What happened was that a user called about his VM being unreachable. I also established that and used the console to view the IP config: it was dead empty; no adapter; nothing.

I was ready to blame one of my colleagues for being thick by removing a nic from a live production VM but then established through vCenter logs that it wasn&#8217;t done using the vSphere console by a VI admin.

I then took a look at the vmware-**.log files on the datastore for that VM and discovered this message:

> `vmx| Powering off Ethernet0`  
> `vmx| Hot removal done.`

Okay so this was a hot removal but not by a VM admin; how is that ?

Well some _very extensive_ research (<a href="http://www.google.nl/search?q=vmware+nic+disappeared" target="_blank">googling &#8220;VMware nic disappeared&#8221;</a>) lead me to <cite><a title="http://kb.vmware.com/kb/1023720" href="http://kb.vmware.com/kb/1023720" target="_blank">kb.<strong>vmware</strong>.com/kb/1023720</a></cite><cite>.</cite>

And there you&#8217;ll find the explanation of the amazing HotPlug feature introduced in ESX(i) 4&#8230;

So the cause of the disappeared NIC was that a user with administrative privileges within a Windows VM gets this _dandy handy_ HotPlug feature from VMware and the user was able to delete the NIC in just 2 simple clicks:

[<img class="aligncenter size-full wp-image-1881" title="HotPlug_inguest_E1000_removal" src="https://svenhuisman.com/wp-content/uploads/2011/04/HotPlug_inguest_E1000_removal.png" alt="" width="407" height="52" srcset="https://svenhuisman.com/wp-content/uploads/2011/04/HotPlug_inguest_E1000_removal.png 407w, https://svenhuisman.com/wp-content/uploads/2011/04/HotPlug_inguest_E1000_removal-350x44.png 350w" sizes="(max-width: 407px) 100vw, 407px" />](https://svenhuisman.com/wp-content/uploads/2011/04/HotPlug_inguest_E1000_removal.png)

This gives any administrator within the guest OS the ability to fully remove the NIC from the VM config! Why is this feature is turned on by default ?! This is, in my opinion, a great risk in a virtual environment. Sure you&#8217;re right when you say; you should think twice before giving people full admin privileges on the OS. But in the real world, there are always people with administrative privileges that have little knowledge of what mayhem they can cause. This HotPlug feature being enabled by default doesn&#8217;t really help the situation.

But just disable it and you&#8217;re done you might think; this is partially true. If you have one VM that&#8217;s doable. But the procedure is that you have to <span style="text-decoration: underline;">power off the VM</span> and then <span style="text-decoration: underline;">fix the VMX</span> file by adding **<span style="text-decoration: underline;">devices.hotplug = &#8220;false&#8221;</span>** to it. This really does not make me happy for an environment with hundreds of VM&#8217;s. There is a suggested registry hack that might do the trick but even that seems to be too tricky to push with a GPO.

I really wonder why this feature is enabled by default anyways: you don&#8217;t let a user of a server in your datacentre to remove a physical NIC from a physical server, right ? Why then give them that possibility in a virtual environment? In my opinion the HotPlug feature can do more harm than good. If you do have real use cases for this feature; please let me know; I love to learn!

Nevertheless, I’m afraid this is going to cost me quite some effort to disable this feature for all current VM’s in the datacentre. If you have any suggestions on how to fix this in a scripted though controlled way I’m all ears!

Sources:  
<a title="http://blogs.vmware.com/kb/2010/06/nic-is-missing-in-my-virtual-machine.html" href="http://blogs.vmware.com/kb/2010/06/nic-is-missing-in-my-virtual-machine.html" target="_blank">http://blogs.vmware.com/kb/2010/06/nic-is-missing-in-my-virtual-machine.html</a>  
<a title="http://kb.vmware.com/kb/1023720" href="http://kb.vmware.com/kb/1023720" target="_blank">http://kb.<strong>vmware</strong>.com/kb/1023720<br /> </a> <a title="http://kb.vmware.com/kb/1012225" href="http://kb.vmware.com/kb/1012225" target="_blank">http://kb.<strong>vmware</strong>.com/kb/1012225</a>