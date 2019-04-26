---
id: 22218
title: 'Windows 10 in non-persistent VDI – Login speed – part 1'
date: 2017-03-05T22:28:16+02:00
author: Sven Huisman
layout: post
guid: https://SvenHuisman.com/?p=22218
permalink: /2017/03/windows-10-in-non-persistent-vdi-login-speed-part-1/
enclosure:
  - |
    https://svenhuisman.com/wp-content/uploads/2017/03/W10-Clean-domain-firstlogin-1vCPU.mp4
    15072610
    video/mp4
    
  - |
    https://svenhuisman.com/wp-content/uploads/2017/03/W10-Clean-domain-firstlogin.mp4
    10451629
    video/mp4
    
  - |
    https://svenhuisman.com/wp-content/uploads/2017/03/W10-LTSB-Clean-domain-firstlogin.mp4
    9604168
    video/mp4
    
  - |
    https://svenhuisman.com/wp-content/uploads/2017/03/W10-GPO-domain-firstlogin.mp4
    10201207
    video/mp4
    
  - |
    https://svenhuisman.com/wp-content/uploads/2017/03/W10-LTSB-GPO-domain-firstlogin.mp4
    8321144
    video/mp4
    
categories:
  - Virtual Desktop
tags:
  - Horizon
  - Instant clones
  - login
  - optimization
  - optimized
  - speed
  - VMware
  - Windows 10
---
In the upcoming blogposts I will write about optimizing Windows 10 in a non-persistent VDI environment and especially focus on optimizing the login speed. <a href="https://robbeekmans.net/euc/tuning-microsoft-windows-10-part-0-versionbuild-use/" target="_blank">Rob Beekmans</a> already blogged about optimizing Windows 10 for VDI, I will focus on optimizing the login experience and the impact of User Environment Management solutions. The plan is to combine all the optimizations and results and create a whitepaper.

## Introduction

In most Virtual Desktop Infrastructures (VDI) the operating system being used for the virtual desktops is still Windows 7 (we all skipped Windows 8.x). One of the reason is that when using Windows 7 you are certain that most (legacy) applications will work. Another reason that Windows 10 is not the common OS used in VDI environments is that it is more difficult to remove or disable the &#8220;consumer&#8221; experience, like cortana, (builtin) Windows Store Apps or to manage the Windows tiles. Especially login to Windows 10 for the first time can take a while. With persistent desktops, where the user profile is stored on the VDI-desktop and the user will always log on to the same desktop, this is not a problem. Only the first time a user logs on to their desktop is slow. But the next time the user logs on again, the login duration is within 5 seconds.

As 80-90% of the VDI-environments are non-persistent, this can be quiet a challenge. Especially getting a fast logon with a non-persistent Windows 10 environment can be tricky. Imagine that a user has to wait a while every time he or she logs onto their Windows 10 VDI because Windows is &#8220;getting things ready&#8221;.

[<img class="wp-image-22219 aligncenter" src="https://svenhuisman.com/wp-content/uploads/2017/03/getting-ready.png" alt="" width="421" height="316" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/getting-ready.png 964w, https://svenhuisman.com/wp-content/uploads/2017/03/getting-ready-350x263.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/getting-ready-768x576.png 768w, https://svenhuisman.com/wp-content/uploads/2017/03/getting-ready-650x488.png 650w" sizes="(max-width: 421px) 100vw, 421px" />](https://svenhuisman.com/wp-content/uploads/2017/03/getting-ready.png)

In this blog post series, I will investigate how to get the fastest login with a non-persistent Windows 10 environment and what is the impact of using a profile management solution. In this first blogpost, I describe the test environment I will use for these tests and give a couple of preliminary results. In the following blogposts, I will present the results of login speeds of a clean Windows 10 installation and compare it with different kind of optimizations. There are a lot of optimizations that can be applied to Windows 10, but not all of them will have an impact on the login speed.

Areas which can be optimized in Windows 10:

  * Remove Builtin Windows Store Apps
  * Disable Active Setup and Run-keys
  * Disable Scheduled tasks
  * Disable services
  * Registry optimizations
  * Optimize default profile

After applying these optimizations, I will compare different kind of profile management solutions, like VMware User Environment Manager, RES ONE Workspace and FSLogix. Next step will be to add Office 2016 to the image and see what the impact is to the Windows 10 Login. I will also configure basic User Environment settings, like drive mappings, shortcuts, user policies and printers using various UEM solutions, to see what the impact is on the Windows 10 login speed.

## Test infrastructure

I&#8217;m lucky to be able to use the hardware that was previously used for the <a href="https://www.projectvrc.com" target="_blank">Project VRC</a> tests. In 2015, Project VRC already performed analysis on what the impact is on <a href="https://www.projectvrc.com/white-papers/18-windows-10-in-vdi-first-analysis/file" target="_blank">optimizing Windows 10</a>. The difference now is that I use the latest Windows 10 version (1607) and will focus on login speed, not on maximizing user density.

the following infrastructure for the tests:

Hardware:

  * 2x Cisco UCS blades B200-M2 for the Backend infrastructure (Domain Controllers, DHCP, DNS, File services, vCenter server Appliance for Backend hosts, vCenter server Appliance for VDI host, etc).
  * 1x Cisco UCS blade B230-M2 for VDI, vSphere ESXi 6.5, 2x 10 core CPU (2.266GHz), 256GB RAM
  * Hitachi AMS2100 FC shared storage

For more details on the hardware, see the whitepaper <a href="https://www.projectvrc.com/white-papers/13-architecture-and-hardware-setup-2013-2016/file" target="_blank">Architecture and hardware setup 2013-2016</a>.

Software:

  * One Connection server: VMware Horizon 7
  * A dedicated vCenter Appliance 6.5
  * A fileserver for collecting logfiles (Splunk/UberAgent), storing profile-data and loginVSI files.

And that&#8217;s it!

I use VMware Horizon instant clones because of the architecture and the components you need. Just a single Connection server and a vCenter appliance and you&#8217;re good to go. No database, no composer, I don&#8217;t think it can be easier.

I will use <a href="https://www.loginvsi.com" target="_blank">LoginVSI</a> to automate the login process and I will use <a href="https://uberagent.com" target="_blank">UberAgent</a> to analyse the logon durations. Initially, I will keep the Windows 10 image as clean as possible. These are the installed components:

[<img class="aligncenter size-full wp-image-22287" src="https://svenhuisman.com/wp-content/uploads/2017/03/installedsoftware.png" alt="" width="711" height="154" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/installedsoftware.png 711w, https://svenhuisman.com/wp-content/uploads/2017/03/installedsoftware-350x76.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/installedsoftware-650x141.png 650w" sizes="(max-width: 711px) 100vw, 711px" />](https://svenhuisman.com/wp-content/uploads/2017/03/installedsoftware.png)

Initially, Microsoft Onedrive was also installed, I removed that.

I have a couple of default group policy settings applied:

**Default GPO settings (CP-VDI-Default)**

<img class="aligncenter wp-image-22227" src="https://svenhuisman.com/wp-content/uploads/2017/03/CP-VDI-Default.png" alt="" width="304" height="637" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/CP-VDI-Default.png 349w, https://svenhuisman.com/wp-content/uploads/2017/03/CP-VDI-Default-167x350.png 167w" sizes="(max-width: 304px) 100vw, 304px" /> 

## Preliminary results

My first test is to set a baseline login duration of a new user. I used the following Windows 10 VM:

  * Windows 10, 64 bit, 1607 Enterprise edition
  * 1 vCPU
  * 4GB RAM
  * 40GB harddisk

This is the first baseline:

<div style="width: 650px;" class="wp-video">
  <!--[if lt IE 9]><![endif]--><video class="wp-video-shortcode" id="video-22218-1" width="650" height="488" preload="metadata" controls="controls"><source type="video/mp4" src="https://svenhuisman.com/wp-content/uploads/2017/03/W10-Clean-domain-firstlogin-1vCPU.mp4?_=1" />
  
  <a href="https://svenhuisman.com/wp-content/uploads/2017/03/W10-Clean-domain-firstlogin-1vCPU.mp4">https://svenhuisman.com/wp-content/uploads/2017/03/W10-Clean-domain-firstlogin-1vCPU.mp4</a></video>
</div>

As you can see in the video, it took <span style="text-decoration: underline;">50 second</span> for the first login to complete. According to UberAgent, the login was finished after 25.70 seconds:

[<img class="aligncenter size-full wp-image-22288" src="https://svenhuisman.com/wp-content/uploads/2017/03/1vCPU-firstlogon1.png" alt="" width="560" height="231" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/1vCPU-firstlogon1.png 560w, https://svenhuisman.com/wp-content/uploads/2017/03/1vCPU-firstlogon1-350x144.png 350w" sizes="(max-width: 560px) 100vw, 560px" />](https://svenhuisman.com/wp-content/uploads/2017/03/1vCPU-firstlogon1.png)

More detailed:

[<img class="aligncenter size-full wp-image-22291" src="https://svenhuisman.com/wp-content/uploads/2017/03/1vCPU-firstlogon2-1.png" alt="" width="931" height="47" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/1vCPU-firstlogon2-1.png 931w, https://svenhuisman.com/wp-content/uploads/2017/03/1vCPU-firstlogon2-1-350x18.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/1vCPU-firstlogon2-1-768x39.png 768w, https://svenhuisman.com/wp-content/uploads/2017/03/1vCPU-firstlogon2-1-650x33.png 650w" sizes="(max-width: 931px) 100vw, 931px" />](https://svenhuisman.com/wp-content/uploads/2017/03/1vCPU-firstlogon2-1.png)This is half the time that the user is experiencing, which is kind of weird.

So this is a clean login, without setting User environment settings, like drive mappings, start menu shortcuts, user policies, printers, etc. Normally, this will add 10-60 more seconds, depending on the UEM solution you choose and what settings you apply. I&#8217;ve seen environments where this can take even more time.

Let&#8217;s dig a little deeper with UberAgent. In the following table, the Logon performance per process type is shown:

[<img class="aligncenter size-large wp-image-22294" src="https://svenhuisman.com/wp-content/uploads/2017/03/Login25sec-process.png" alt="" width="650" height="159" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/Login25sec-process.png 757w, https://svenhuisman.com/wp-content/uploads/2017/03/Login25sec-process-350x86.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/Login25sec-process-650x159.png 650w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/03/Login25sec-process.png)

&#8220;Other&#8221; and Shell are responsible for most of the CPU time and &#8220;Other&#8221; is also responsible for the highest IO count. To see which processes are responsible for the high CPU time, in the following table I sorted the top processes for CPU time:

Top CPU time:

[<img class="aligncenter size-large wp-image-22292" src="https://svenhuisman.com/wp-content/uploads/2017/03/Login25sec-CPU-1024x215.png" alt="" width="650" height="136" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/Login25sec-CPU-1024x215.png 1024w, https://svenhuisman.com/wp-content/uploads/2017/03/Login25sec-CPU-350x73.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/Login25sec-CPU-768x161.png 768w, https://svenhuisman.com/wp-content/uploads/2017/03/Login25sec-CPU-650x136.png 650w, https://svenhuisman.com/wp-content/uploads/2017/03/Login25sec-CPU.png 1226w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/03/Login25sec-CPU.png)

Top IO count:[<img class="aligncenter size-large wp-image-22293" src="https://svenhuisman.com/wp-content/uploads/2017/03/Login25sec-IO-1024x196.png" alt="" width="650" height="124" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/Login25sec-IO-1024x196.png 1024w, https://svenhuisman.com/wp-content/uploads/2017/03/Login25sec-IO-350x67.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/Login25sec-IO-768x147.png 768w, https://svenhuisman.com/wp-content/uploads/2017/03/Login25sec-IO-650x125.png 650w, https://svenhuisman.com/wp-content/uploads/2017/03/Login25sec-IO.png 1230w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/03/Login25sec-IO.png)

I&#8217;m not using flash-storage, but I can assure you IOPS is not a bottleneck in my test environment. But depending on the rate the users in your environment login to their virtual desktop (what is the maximum number of users concurrently logging on peak hours?), this should be taken into consideration when sizing a Windows 10 VDI environment. More on that in a later blogpost.

## Optimizations

The first optimization is to add another vCPU. 1 vCPU is clearly not enough for Windows 10. 2 vCPU is the minimum I advice my customers. In some cases 3 vCPU is even better, when using PCoIP as a display protocol and you don&#8217;t have Teradici APEX cards for example.

So what is the logon duration with 2 vCPU:

<div style="width: 650px;" class="wp-video">
  <video class="wp-video-shortcode" id="video-22218-2" width="650" height="486" preload="metadata" controls="controls"><source type="video/mp4" src="https://svenhuisman.com/wp-content/uploads/2017/03/W10-Clean-domain-firstlogin.mp4?_=2" /><a href="https://svenhuisman.com/wp-content/uploads/2017/03/W10-Clean-domain-firstlogin.mp4">https://svenhuisman.com/wp-content/uploads/2017/03/W10-Clean-domain-firstlogin.mp4</a></video>
</div>

As you can see in the video, it took <span style="text-decoration: underline;">28 second</span> for the first login to complete. According to UberAgent, the login was finished after 13.45 seconds:

[<img class="aligncenter size-large wp-image-22296" src="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-firstlogon2.png" alt="" width="411" height="209" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-firstlogon2.png 411w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-firstlogon2-350x178.png 350w" sizes="(max-width: 411px) 100vw, 411px" />](https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-firstlogon2.png)

More detailed:

[<img class="aligncenter size-full wp-image-22295" src="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-firstlogon1.png" alt="" width="905" height="52" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-firstlogon1.png 905w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-firstlogon1-350x20.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-firstlogon1-768x44.png 768w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-firstlogon1-650x37.png 650w" sizes="(max-width: 905px) 100vw, 905px" />](https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-firstlogon1.png)

That’s still almost half the time compared to the 1 vCPU VM. Let me remind you, this is still without setting the user environment. But we want the first login to be as fast as possible, as it will be a first login every time a user logs on to a non-persistent desktop.

## Windows 10 versions

Now let&#8217;s discuss Windows 10 versions. I&#8217;m using the Windows 10 x64 1607 Enterprise edition, but this version has the Windows store, Windows Store Apps and some other stuff you probably don&#8217;t need in a VDI environment. As an alternative, I will use the Long term Servicing Branch (LTSB) edition. This version doesn&#8217;t have the Windows store, the builtin Windows apps and the Edge browser, but is more lean and mean for VDI. I&#8217;m interested in the login difference between the two.

First login, with 2 vCPUs and for the rest the same config as above.

<div style="width: 650px;" class="wp-video">
  <video class="wp-video-shortcode" id="video-22218-3" width="650" height="488" preload="metadata" controls="controls"><source type="video/mp4" src="https://svenhuisman.com/wp-content/uploads/2017/03/W10-LTSB-Clean-domain-firstlogin.mp4?_=3" /><a href="https://svenhuisman.com/wp-content/uploads/2017/03/W10-LTSB-Clean-domain-firstlogin.mp4">https://svenhuisman.com/wp-content/uploads/2017/03/W10-LTSB-Clean-domain-firstlogin.mp4</a></video>
</div>

As you can see in the video, it took 25 second for the first login to complete. According to UberAgent, the login was finished after 9.67 seconds:

[<img class="aligncenter size-full wp-image-22297" src="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-firstlogon1.png" alt="" width="469" height="209" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-firstlogon1.png 469w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-firstlogon1-350x156.png 350w" sizes="(max-width: 469px) 100vw, 469px" />](https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-firstlogon1.png)

More detailed:

[<img class="aligncenter size-large wp-image-22298" src="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-firstlogon2.png" alt="" width="650" height="36" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-firstlogon2.png 893w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-firstlogon2-350x20.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-firstlogon2-768x43.png 768w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-firstlogon2-650x36.png 650w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-firstlogon2.png)

## Group Policy

Next step is to add a Computer Group Policy to adjust some basic settings for a (non-persistent) VDI environment. The GPO settings I added where:

[<img class="aligncenter size-full wp-image-22228" src="https://svenhuisman.com/wp-content/uploads/2017/03/CP-VDI-Non-persistent1.png" alt="" width="711" height="740" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/CP-VDI-Non-persistent1.png 711w, https://svenhuisman.com/wp-content/uploads/2017/03/CP-VDI-Non-persistent1-336x350.png 336w, https://svenhuisman.com/wp-content/uploads/2017/03/CP-VDI-Non-persistent1-650x677.png 650w" sizes="(max-width: 711px) 100vw, 711px" />](https://svenhuisman.com/wp-content/uploads/2017/03/CP-VDI-Non-persistent1.png) [<img class="aligncenter size-full wp-image-22229" src="https://svenhuisman.com/wp-content/uploads/2017/03/CP-VDI-Non-persistent2.png" alt="" width="713" height="449" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/CP-VDI-Non-persistent2.png 713w, https://svenhuisman.com/wp-content/uploads/2017/03/CP-VDI-Non-persistent2-350x220.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/CP-VDI-Non-persistent2-650x409.png 650w" sizes="(max-width: 713px) 100vw, 713px" />](https://svenhuisman.com/wp-content/uploads/2017/03/CP-VDI-Non-persistent2.png)

Disabling the setting &#8220;**show first sign-in animation**&#8221; should speed up the login for the user. The following video shows the login with the Windows 10 1607 Enterprise edition (not the LTSB version):

<div style="width: 650px;" class="wp-video">
  <video class="wp-video-shortcode" id="video-22218-4" width="650" height="487" preload="metadata" controls="controls"><source type="video/mp4" src="https://svenhuisman.com/wp-content/uploads/2017/03/W10-GPO-domain-firstlogin.mp4?_=4" /><a href="https://svenhuisman.com/wp-content/uploads/2017/03/W10-GPO-domain-firstlogin.mp4">https://svenhuisman.com/wp-content/uploads/2017/03/W10-GPO-domain-firstlogin.mp4</a></video>
</div>

The user experiences a login duration of 23 seconds. The user doesn&#8217;t see the first-login animation (getting things ready) and compared to the first test with a 2 vCPU VM, this is 27 seconds faster. According to UberAgent, the login duration is 13.34 seconds (compared to 25.70):

[<img class="aligncenter size-full wp-image-22300" src="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-GPO-firstlogon1.png" alt="" width="510" height="220" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-GPO-firstlogon1.png 510w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-GPO-firstlogon1-350x151.png 350w" sizes="(max-width: 510px) 100vw, 510px" />](https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-GPO-firstlogon1.png)

More detailed:

[<img class="aligncenter size-large wp-image-22301" src="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-GPO-firstlogon2.png" alt="" width="650" height="33" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-GPO-firstlogon2.png 896w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-GPO-firstlogon2-350x18.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-GPO-firstlogon2-768x39.png 768w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-GPO-firstlogon2-650x33.png 650w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-GPO-firstlogon2.png)

And with the LTSB version:

<div style="width: 650px;" class="wp-video">
  <video class="wp-video-shortcode" id="video-22218-5" width="650" height="487" preload="metadata" controls="controls"><source type="video/mp4" src="https://svenhuisman.com/wp-content/uploads/2017/03/W10-LTSB-GPO-domain-firstlogin.mp4?_=5" /><a href="https://svenhuisman.com/wp-content/uploads/2017/03/W10-LTSB-GPO-domain-firstlogin.mp4">https://svenhuisman.com/wp-content/uploads/2017/03/W10-LTSB-GPO-domain-firstlogin.mp4</a></video>
</div>

The user experiences a login duration of 14 seconds. The user doesn&#8217;t see the first-login animation (getting things ready) and compared to the first test with a 2 vCPU VM, this is 11 seconds faster. According to UberAgent, the login duration is 10.48 seconds (compared to 9.67):

[<img class="aligncenter size-full wp-image-22305" src="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-GPO-firstlogon1-1.png" alt="" width="498" height="221" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-GPO-firstlogon1-1.png 498w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-GPO-firstlogon1-1-350x155.png 350w" sizes="(max-width: 498px) 100vw, 498px" />](https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-GPO-firstlogon1-1.png)

&nbsp;

More detailed:

[<img class="aligncenter wp-image-22306 size-full" src="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-GPO-firstlogon2-1.png" width="883" height="48" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-GPO-firstlogon2-1.png 883w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-GPO-firstlogon2-1-350x19.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-GPO-firstlogon2-1-768x42.png 768w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-GPO-firstlogon2-1-650x35.png 650w" sizes="(max-width: 883px) 100vw, 883px" />](https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-GPO-firstlogon2-1.png)

Conclusion: according to Uberagent adding this group policy actually adds a little time to the login process, but for the user it speeds up the login process a lot. There is still a gap between the user experience and what UberAgent thinks the logon duration is, this needs to be investigated. I will keep the CP-VDI-Default and the CP-VDI-non-persistent computer policies as the default for the rest of the tests.

## Persistent profile

I also want to compare the login duration to a situation where the VDI-environment is persistent and the user will always log on to the same virtual desktop. So the first login is a user logs in to a new desktop, the second login is after a reboot, and the user profile is still on the virtual machine.

These are the logon durations according to UberAgent:

[<img class="aligncenter size-full wp-image-22307" src="https://svenhuisman.com/wp-content/uploads/2017/03/compareWin10-ltsb.png" alt="" width="680" height="209" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/compareWin10-ltsb.png 680w, https://svenhuisman.com/wp-content/uploads/2017/03/compareWin10-ltsb-350x108.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/compareWin10-ltsb-650x200.png 650w" sizes="(max-width: 680px) 100vw, 680px" />](https://svenhuisman.com/wp-content/uploads/2017/03/compareWin10-ltsb.png)

This was a first look at my &#8220;Windows 10 logon optimization / User Environment management impact on logon&#8221; research.

Read [part 2 of this blogpost series](https://svenhuisman.com/2017/03/windows-10-in-non-persistent-vdi-login-speed-part-2/).