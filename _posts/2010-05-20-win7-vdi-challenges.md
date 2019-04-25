---
id: 1713
title: '7 &#8220;challenges&#8221; migrating from XP to Windows 7 using VDI'
date: 2010-05-20T12:00:10+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=1713
permalink: /2010/05/win7-vdi-challenges/
categories:
  - Virtual Desktop
tags:
  - best practices
  - challenges
  - Citrix
  - Desktop Virtualization
  - IOPS
  - migration
  - sizing
  - VDI
  - VMware
  - Windows 7
  - Windows XP
---
[](https://svenhuisman.com/wp-content/uploads/2010/05/windows_7.jpg)

[<img class="alignright size-thumbnail wp-image-1717" title="WIN7" src="https://svenhuisman.com/wp-content/uploads/2010/05/WIN7-200x200.png" alt="" width="169" height="143" />](https://svenhuisman.com/wp-content/uploads/2010/05/WIN7.png)Migrating to Windows 7 is something many companies will face the next couple of years. Using desktop virtualization or VDI in the process is something a lot of those companies consider (read Ruben Spruijt&#8217;s article about <a title="Desktop virtualization Win 7" href="http://www.brianmadden.com/blogs/rubenspruijt/archive/2010/02/22/desktop-virtualization-and-the-power-of-windows-7.aspx" target="_blank">the different types of dekstop virtualization and the role of Windows 7</a>). In this article I would like to point out a couple of challenges a company might face when migrating from XP to Windows 7 <span style="text-decoration: underline;">using</span> VDI. Don&#8217;t expect to learn about the advantages of VDI or about best practices for migrating to Windows 7 in general<span>. </span>

<span>Here is my top 7 challenges migrating to Windows 7 using VDI. Feel free to comment.<!--more--></span>

**1. Applications**

<span>Will all the applications run on Windows 7? Do I need to <span>virtualize</span> my applications (in order to run them on Windows 7)? What can I do with applications that don&#8217;t work on Windows 7? Can I use Windows XP mode in a Windows 7 VDI environment or do I have to maintain a separate Windows XP image for applications that will not work on Windows 7? To get 100% of the applications to work on Windows 7 is the biggest challenge when migrating to Windows 7 in general. <span>Virtualizing</span> applications add another level of complexity to this challenge. There are tools available that can help you get information about application </span>compatibility <span>like <a title="App-DNA" href="http://www.app-dna.com/Solutions/Moving-to-Windows-7.aspx" target="_blank">App-DNA</a>. If your company currently has Windows XP and doesn&#8217;t use application <span>virtualization</span> and you would ask me what the best strategy would be to migrate to Windows 7 in a VDI environment, I would advise to take smaller steps at a time, for example:</span>

  * <span><span>Virtualize</span> your apps first, move to VDI with XP, then migrate to Windows 7.</span>
  * <span>Move to VDI with the current environment, <span>virtualize</span> your apps, then migrate to Windows 7.</span>

**2. Sizing**

It&#8217;s no secret Windows 7 uses more resources than Windows XP. In a physical migration from XP to Windows 7, it is more likely that the desktops will be replaced with more powerful hardware as well. In that case, sizing is less important and in most cases the first bottleneck will probably be memory. Sizing will be more difficult for a VDI environment because more detailed information is required for sizing the hosting infrastructure. Not only CPU and memory usage of and the application behavior is important, but especially the disk usage (IOPS and the Read/Write ratio) is critical for sizing a VDI environment (read the <a href="http://www.brianmadden.com/blogs/rubenspruijt/archive/2010/05/02/vdi-and-storage-deep-impact.aspx" target="_blank"><span>VDI and storage = deep impact <span>whitepaper</span></span></a>!).

When migrating from XP to Windows 7 using VDI, it&#8217;s hard to get all these numbers because there is no production environment with Windows 7 to measure. One (bad?) way could be measuring the current XP environment and add a percentage on CPU, memory and IOPS usage. Another (better?) way is to do a representative Proof of Concept with 20% of the target users, using Windows 7 (in a VDI environment).

**3. Licensing**

One major difference in licensing in Windows 7 compared to Windows XP is that Windows 7 needs to be activated. When using Windows 7 in a physical environment you have multiple options to achieve this: Retail or OEM key activation, or by volume activation using <a href="http://technet.microsoft.com/en-us/library/dd996588.aspx" target="_blank">Multiple Activation Key (MAK) or Key Management Service (KMS)</a>. In a virtual environment the only option you have is KMS. Because chances are that with Windows 7 in a VDI environment, snapshots, moving VM’s to other hosts and cloning will be used. KMS activation supports these kinds of operations:

“_<span>Using KMS will transparently support activation throughout the hardware changes associated with moving or replicating <span>VMs</span> across physical systems. Additionally, using KMS activation in a VM environment seamlessly supports the use of undo disks and other reset operations.</span>_”

**4. Best practices Windows 7**

<span>Because of sharing resources in a VDI environment, optimizing your Windows 7 golden image is very important. You definitely don&#8217;t want your Windows 7 <span>VM&#8217;s</span> be wasting CPU cycles, Memory or IOPS. You need to fine-tune your Windows 7 image by using best practices and common sense (disabling services you don&#8217;t need in a VM like WLAN <span>Autoconfig</span> is a good example). But where do I find those best practices? As best practices for Windows 7 in a VDI environment are hard to find at the moment (because it isn&#8217;t used in production yet?). Here is one of the few for </span><a href="http://www.creedtek.com/?p=37" target="_blank">creating the Windows 7 template</a><span>. But how about best practices for # of <span>vCPU’s</span> per VM, # of <span>VM&#8217;s</span> per physical cores, ASLR, pagefile settings, etc.?</span>

**5. User profile settings**

Windows XP profiles are not compatible with Windows 7 profiles. This will not make any difference if you migrate from XP to Windows 7 in a physical or in a virtual environment. So you will have to find a way to migrate those settings to a new profile, using User state migration tool or 3rd party tooling (like <a href="http://www.ressoftware.com/pm-products.aspx?PageID=174" target="_blank"><span>RES <span>Powerfuse</span></span></a>, <a href="http://www.liquidwarelabs.com/products/profileunity.asp" target="_blank"><span><span>StratuSphere</span> Profile Unity</span></a>, <a href="http://immidio.com/flexprofiles/" target="_blank"><span><span>Immidio</span> Flex profiles</span></a>). What can be different in a virtual environment is that every time a user logs on to a virtual desktop, the user could be logging on to a different or clean virtual desktop. A decision is to be made about whether user are allowed to keep their personal settings and if so, how are the user profiles managed (folder redirection, roaming profiles or any of the previous mentioned 3<sup>rd</sup> party tooling)?

**6. User Acceptance**

<span>Not only do the users have to work with a different Operating System, they will also have to work with a remote display protocol (whether it&#8217;s RDP, ICA, <span>PCoIP</span> or any other protocol). Will the user experience meet the expectations of the users? And if application virtualization is used as well, maybe the launch time of applications is not what users are used to. Prepare the users for all those changes and communication to the users is very important. If some of the expectations can&#8217;t be met, you might have to give something extra to the users (like a much larger screen or even a second screen: &#8220;Wow, I now have a much larger PC, thanks IT department!&#8221;).</span>

**7. Endpoint devices**

<span>What kind of endpoint devices will you use? As always, this depends on the requirements, but here are some points to keep in mind. One of the options is to repurpose your old desktops as an endpoint device for your VDI infrastructure. But which OS are you going to install to that and how do you maintain that OS? If it’s going to be XP, it will be another OS to maintain and manage. If it’s going to be Windows 7, why are you using VDI in the first place? 😉 Or maybe thin client OS software build for repurpose PC’s (like the new </span><a href="http://www.wyse.com/products/software/pcextender/index.asp" target="_blank"><span><span>Wyse</span> PC extender software</span></a><span>) is the best option for your old PC’s? Thin or zero clients are the alternative, for those, but how about notebooks? Are they migrated as well to Windows 7 or will they become an <span>unmanaged</span> Windows XP notebook, connecting to a Windows 7 VM? Do I need/dare to consider a client <span>baremetal</span> <span>hypervisor</span> like <span>Xenclient</span>? Each option has it&#8217;s pros and cons. If you would ask me, I don&#8217;t want to manage (a lot) at the endpoint devices and I would go as thin is possible (in a situation where a migration from XP to Win 7 in a VDI environment).</span>

**What&#8217;s next?**

These challenges are just the beginning (and fun for me as a consultant). Wait until a Windows 7 VDI environment is actually being used. That’s when you will face the real challenges! 😉 But to end positive, an implementation of a virtualized Windows 7 environment will be done more and more. And the lessons learned from those implementations will be transformed into best practices and published on the web (at least if the implementations are done by me 🙂 ).