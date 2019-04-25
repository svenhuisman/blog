---
id: 22448
title: 'Windows 10 in non-persistent VDI - Login speed part 2'
date: 2017-03-12T22:37:47+02:00
author: Sven Huisman
layout: post
guid: http://SvenHuisman.com/?p=22448
permalink: /2017/03/windows-10-in-non-persistent-vdi-login-speed-part-2/
categories:
  - Desktop OS
  - Virtual Desktop
tags:
  - Apps
  - CB
  - Horizon
  - Instant clones
  - login
  - LoginVSI
  - LTSB
  - optimisation
  - optimization
  - optimized
  - speed
  - Store
  - UberAgent
  - VMware
  - Windows 10
---
I&#8217;m researching the impact of various Windows 10 optimizations on login duration, especially in a non-persistent VDI environment. In the <a href="http://wp.me/phahV-5Mm" target="_blank">first part of this blog-series</a>, I described the infrastructure and showed some preliminary results. One of the issues I had was the difference in login time of what was measured with the stopwatch versus what <a href="http://www.uberagent.com" target="_blank">UberAgent</a> logged as login time. Fortunately, that has been resolved now (thanks to <a href="https://helgeklein.com" target="_blank">Helge Klein</a> and his team) and I decided to redo the first tests. I also performed the test using <a href="http://www.loginvsi.com" target="_blank">LoginVSI</a>, just to automate multiple logins, not for simulating a workload (yet).

## Disable Windows updates and Windows Module Installer

After performing the first tests with 10 login sessions in a row I noticed high CPU load on the host:

[<img class="aligncenter size-full wp-image-22450" src="https://svenhuisman.com/wp-content/uploads/2017/03/Host-HighCPU.png" alt="" width="941" height="303" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/Host-HighCPU.png 941w, https://svenhuisman.com/wp-content/uploads/2017/03/Host-HighCPU-350x113.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/Host-HighCPU-768x247.png 768w, https://svenhuisman.com/wp-content/uploads/2017/03/Host-HighCPU-650x209.png 650w" sizes="(max-width: 941px) 100vw, 941px" />](https://svenhuisman.com/wp-content/uploads/2017/03/Host-HighCPU.png)

  * 10:36: boot 10 VMs (instant clones = resume)
  * 10:51: First login. Then every 2 minutes, 1 login, 6th was skipped)
  * 11:09: 10th and final login. After that, CPU-load still 50%.

Looking at the load of a VM:

[<img class="aligncenter size-large wp-image-22453" src="https://svenhuisman.com/wp-content/uploads/2017/03/VM-HighCPU-1024x268.png" alt="" width="650" height="170" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/VM-HighCPU-1024x268.png 1024w, https://svenhuisman.com/wp-content/uploads/2017/03/VM-HighCPU-350x92.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/VM-HighCPU-768x201.png 768w, https://svenhuisman.com/wp-content/uploads/2017/03/VM-HighCPU-650x170.png 650w, https://svenhuisman.com/wp-content/uploads/2017/03/VM-HighCPU.png 1141w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/03/uber-high-CPU.png)

Apparently, the load was already high before logging in. The high CPU-load stopped at 11:25.

This was for every VM. Luckily, I have UberAgent running, so the cause was quickly found:

[<img class="aligncenter size-large wp-image-22451" src="https://svenhuisman.com/wp-content/uploads/2017/03/uber-high-CPU.png" alt="" width="650" height="311" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/uber-high-CPU.png 673w, https://svenhuisman.com/wp-content/uploads/2017/03/uber-high-CPU-350x167.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/uber-high-CPU-650x311.png 650w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/03/uber-high-CPU.png)The process &#8220;TiWorker.exe&#8221; is causing the high CPU load. This process is also causing high IO-load:

[<img class="aligncenter size-large wp-image-22452" src="https://svenhuisman.com/wp-content/uploads/2017/03/uber-high-IO.png" alt="" width="650" height="288" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/uber-high-IO.png 720w, https://svenhuisman.com/wp-content/uploads/2017/03/uber-high-IO-350x155.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/uber-high-IO-650x288.png 650w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/03/uber-high-IO.png)The TIWorker.exe is a system component in Microsoft Windows which is responsible for installing new modules and updates. The Windows update service was already disabled, but there is another service which is responsible for downloading and installing new modules: The service **Windows Modules Installer.** After disabling this service, the CPU-load is much butter after logging in sessions on the VMs:

[<img class="aligncenter size-full wp-image-22454" src="https://svenhuisman.com/wp-content/uploads/2017/03/Host-normalCPU.png" alt="" width="621" height="287" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/Host-normalCPU.png 621w, https://svenhuisman.com/wp-content/uploads/2017/03/Host-normalCPU-350x162.png 350w" sizes="(max-width: 621px) 100vw, 621px" />](https://svenhuisman.com/wp-content/uploads/2017/03/Host-normalCPU.png)

For all the tests I performed, I disable this service (and the Windows update service) so this won&#8217;t mess up the results.

## Baseline

For each test, I perform 10 logins, with 2 minutes in between. The averages of those 10 logins are taken to calculate the average. The first test is to set a baseline login duration of a new user. I used the following Windows 10 VM parameters:

  * Windows 10, 64 bit, 1607 Enterprise edition
  * 1 vCPU
  * 4GB RAM
  * 40GB harddisk

1 vCPU is not what I normally recommend, but it is interesting to see how it compares to 2 vCPU VMs (which will be the default for the other tests).

According to UberAgent, the average login for the 10 logins was 70.19 seconds:

[<img class="aligncenter size-full wp-image-22487" src="https://svenhuisman.com/wp-content/uploads/2017/03/1vCPU-firstlogon1-1.png" alt="" width="779" height="321" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/1vCPU-firstlogon1-1.png 779w, https://svenhuisman.com/wp-content/uploads/2017/03/1vCPU-firstlogon1-1-350x144.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/1vCPU-firstlogon1-1-768x316.png 768w, https://svenhuisman.com/wp-content/uploads/2017/03/1vCPU-firstlogon1-1-650x268.png 650w" sizes="(max-width: 779px) 100vw, 779px" />](https://svenhuisman.com/wp-content/uploads/2017/03/1vCPU-firstlogon1-1.png)

Logon duration:

[<img class="aligncenter size-large wp-image-22488" src="https://svenhuisman.com/wp-content/uploads/2017/03/1vCPU-firstlogon2-2.png" alt="" width="650" height="267" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/1vCPU-firstlogon2-2.png 718w, https://svenhuisman.com/wp-content/uploads/2017/03/1vCPU-firstlogon2-2-350x144.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/1vCPU-firstlogon2-2-650x267.png 650w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/03/1vCPU-firstlogon2-2.png)

Logon per section:

[<img class="aligncenter size-large wp-image-22489" src="https://svenhuisman.com/wp-content/uploads/2017/03/1vCPU-firstlogon3.png" alt="" width="530" height="260" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/1vCPU-firstlogon3.png 530w, https://svenhuisman.com/wp-content/uploads/2017/03/1vCPU-firstlogon3-350x172.png 350w" sizes="(max-width: 530px) 100vw, 530px" />](https://svenhuisman.com/wp-content/uploads/2017/03/1vCPU-firstlogon3.png)

There was one session which took more than 12 seconds extra compared to the average. So for the final calculations, I will probably leave out the fastest and the slowest login and take average of the middle 8.

This is a clean login, without optimizations and without applying User environment settings (like drive mappings, start menu shortcuts, user policies, printers, etc.). There is only 1 group policy active (see the first blogpost for the GPO-settings). Setting User Environment settings will add 10-60 more seconds, depending on the UEM solution you choose and what settings you apply. I&#8217;ve seen environments where this can take even more time. This will be one of the test-scenario&#8217;s later on.

## Optimizations

The first optimization is to add another vCPU. 1 vCPU is clearly not enough for Windows 10. 2 vCPU is the minimum I advice my customers. In some cases 3 vCPU is even better, when using PCoIP as a display protocol and you don&#8217;t have Teradici APEX cards for example.

The average login duration now is 30.71 seconds:

[<img class="aligncenter size-full wp-image-22491" src="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-firstlogon1-1.png" alt="" width="924" height="326" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-firstlogon1-1.png 924w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-firstlogon1-1-350x123.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-firstlogon1-1-768x271.png 768w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-firstlogon1-1-650x229.png 650w" sizes="(max-width: 924px) 100vw, 924px" />](https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-firstlogon1-1.png)

Logon duration:

[<img class="aligncenter size-large wp-image-22492" src="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-firstlogon2-1.png" alt="" width="650" height="279" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-firstlogon2-1.png 735w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-firstlogon2-1-350x150.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-firstlogon2-1-650x279.png 650w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-firstlogon2-1.png)

Logon per section:

[<img class="aligncenter size-large wp-image-22493" src="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-firstlogon3.png" alt="" width="537" height="261" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-firstlogon3.png 537w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-firstlogon3-350x170.png 350w" sizes="(max-width: 537px) 100vw, 537px" />](https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-firstlogon3.png)

In this case, there was one session 7 seconds faster then the other sessions. But the average is still half the time compared to the 1 vCPU VM. Let me remind you, this is still without setting the user environment. But we want the first login to be as fast as possible, as it will be a first login every time a user logs on to a non-persistent desktop.

## Windows 10 versions

Now let&#8217;s discuss Windows 10 versions. I&#8217;m using the Windows 10 x64 1607 (Current Branch) Enterprise edition. This version has the Windows store, Windows Store Apps and some other stuff you probably don&#8217;t need in a VDI environment (VDI is for legacy applications, right?). As an alternative, I will also test the Long term Servicing Branch (LTSB) edition. This version doesn&#8217;t have the Windows store, the builtin Windows apps and the Edge browser, but is more lean and mean for VDI. I&#8217;m interested in the login difference between the two.

Testing with a 2 vCPU VM, 4GB RAM and 40GB disk, the average login duration with the LTSB version is 17.91 seconds:

[<img class="aligncenter size-full wp-image-22516" src="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-firstlogon1-1.png" alt="" width="794" height="331" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-firstlogon1-1.png 794w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-firstlogon1-1-350x146.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-firstlogon1-1-768x320.png 768w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-firstlogon1-1-650x271.png 650w" sizes="(max-width: 794px) 100vw, 794px" />](https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-firstlogon1-1.png)

Logon duration:

[<img class="aligncenter size-large wp-image-22517" src="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-firstlogon2-1.png" alt="" width="650" height="286" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-firstlogon2-1.png 717w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-firstlogon2-1-350x154.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-firstlogon2-1-650x286.png 650w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-firstlogon2-1.png)

Logon per section:

[<img class="aligncenter size-large wp-image-22518" src="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-firstlogon3.png" alt="" width="537" height="266" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-firstlogon3.png 537w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-firstlogon3-350x173.png 350w" sizes="(max-width: 537px) 100vw, 537px" />](https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-LTSB-firstlogon3.png)

Again with one session a bit off compared to the others. But still almost 13 seconds faster than the regular Windows 10 version.

## Group Policy

Next step is to add a Computer Group Policy to adjust some basic settings for a (non-persistent) VDI environment. The GPO settings I added where:

[<img class="aligncenter size-full wp-image-22228" src="https://svenhuisman.com/wp-content/uploads/2017/03/CP-VDI-Non-persistent1.png" alt="" width="711" height="740" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/CP-VDI-Non-persistent1.png 711w, https://svenhuisman.com/wp-content/uploads/2017/03/CP-VDI-Non-persistent1-336x350.png 336w, https://svenhuisman.com/wp-content/uploads/2017/03/CP-VDI-Non-persistent1-650x677.png 650w" sizes="(max-width: 711px) 100vw, 711px" />](https://svenhuisman.com/wp-content/uploads/2017/03/CP-VDI-Non-persistent1.png)[<img class="aligncenter size-full wp-image-22229" src="https://svenhuisman.com/wp-content/uploads/2017/03/CP-VDI-Non-persistent2.png" alt="" width="713" height="449" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/CP-VDI-Non-persistent2.png 713w, https://svenhuisman.com/wp-content/uploads/2017/03/CP-VDI-Non-persistent2-350x220.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/CP-VDI-Non-persistent2-650x409.png 650w" sizes="(max-width: 713px) 100vw, 713px" />](https://svenhuisman.com/wp-content/uploads/2017/03/CP-VDI-Non-persistent2.png)

Disabling the setting &#8220;**show first sign-in animation**&#8221; should speed up the login for the user.

The user doesn&#8217;t see the first-login animation (getting things ready) and compared to the first test with a 2 vCPU VM (Windows 10 Current Branch (1607)) this is almost 5 seconds faster. According to UberAgent, the login duration is on average 25.52 seconds:

[<img class="aligncenter size-full wp-image-22460" src="https://svenhuisman.com/wp-content/uploads/2017/03/win10-2cpu-GPO-1.png" alt="" width="892" height="347" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/win10-2cpu-GPO-1.png 892w, https://svenhuisman.com/wp-content/uploads/2017/03/win10-2cpu-GPO-1-350x136.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/win10-2cpu-GPO-1-768x299.png 768w, https://svenhuisman.com/wp-content/uploads/2017/03/win10-2cpu-GPO-1-650x253.png 650w" sizes="(max-width: 892px) 100vw, 892px" />](https://svenhuisman.com/wp-content/uploads/2017/03/win10-2cpu-GPO-1.png)

Logon duration:

[<img class="aligncenter size-large wp-image-22461" src="https://svenhuisman.com/wp-content/uploads/2017/03/win10-2cpu-GPO-2.png" alt="" width="650" height="280" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/win10-2cpu-GPO-2.png 737w, https://svenhuisman.com/wp-content/uploads/2017/03/win10-2cpu-GPO-2-350x151.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/win10-2cpu-GPO-2-650x280.png 650w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/03/win10-2cpu-GPO-2.png)

Logon per section:

[<img class="aligncenter size-large wp-image-22462" src="https://svenhuisman.com/wp-content/uploads/2017/03/win10-2cpu-GPO-3.png" alt="" width="519" height="301" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/win10-2cpu-GPO-3.png 519w, https://svenhuisman.com/wp-content/uploads/2017/03/win10-2cpu-GPO-3-350x203.png 350w" sizes="(max-width: 519px) 100vw, 519px" />](https://svenhuisman.com/wp-content/uploads/2017/03/win10-2cpu-GPO-3.png)

Conclusion: adding this group policy speeds up the login process 5 seconds with the CB version.

The same test but with the LTSB version, the average login duration is 15.38 seconds:

[<img class="aligncenter size-full wp-image-22457" src="https://svenhuisman.com/wp-content/uploads/2017/03/win10-LTSB-2cpu-GPO-1.png" alt="" width="779" height="349" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/win10-LTSB-2cpu-GPO-1.png 779w, https://svenhuisman.com/wp-content/uploads/2017/03/win10-LTSB-2cpu-GPO-1-350x157.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/win10-LTSB-2cpu-GPO-1-768x344.png 768w, https://svenhuisman.com/wp-content/uploads/2017/03/win10-LTSB-2cpu-GPO-1-650x291.png 650w" sizes="(max-width: 779px) 100vw, 779px" />](https://svenhuisman.com/wp-content/uploads/2017/03/win10-LTSB-2cpu-GPO-1.png)

Logon duration:

[<img class="aligncenter size-large wp-image-22458" src="https://svenhuisman.com/wp-content/uploads/2017/03/win10-LTSB-2cpu-GPO-2.png" alt="" width="650" height="292" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/win10-LTSB-2cpu-GPO-2.png 715w, https://svenhuisman.com/wp-content/uploads/2017/03/win10-LTSB-2cpu-GPO-2-350x157.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/win10-LTSB-2cpu-GPO-2-650x292.png 650w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/03/win10-LTSB-2cpu-GPO-2.png)

Logon per section:[<img class="aligncenter size-large wp-image-22459" src="https://svenhuisman.com/wp-content/uploads/2017/03/win10-LTSB-2cpu-GPO-3.png" alt="" width="533" height="301" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/win10-LTSB-2cpu-GPO-3.png 533w, https://svenhuisman.com/wp-content/uploads/2017/03/win10-LTSB-2cpu-GPO-3-350x198.png 350w" sizes="(max-width: 533px) 100vw, 533px" />](https://svenhuisman.com/wp-content/uploads/2017/03/win10-LTSB-2cpu-GPO-3.png)

Conclusion: adding this group policy speeds up the login process 2.5 seconds with the LTSB-version. I will keep the CP-VDI-Default and the CP-VDI-non-persistent computer policies as the default for the rest of the tests.

## Persistent profile

I also want to compare the login duration to a situation where the VDI-environment is persistent and the user will always log on to the same virtual desktop. So the first login is a user logs in to a new desktop, the second login is after a reboot, and the user profile is still on the virtual machine.

These are the logon durations according to UberAgent:

[<img class="aligncenter size-full wp-image-22463" src="https://svenhuisman.com/wp-content/uploads/2017/03/compare1st-2ndlogon.png" alt="" width="695" height="233" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/compare1st-2ndlogon.png 695w, https://svenhuisman.com/wp-content/uploads/2017/03/compare1st-2ndlogon-350x117.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/compare1st-2ndlogon-650x218.png 650w" sizes="(max-width: 695px) 100vw, 695px" />](https://svenhuisman.com/wp-content/uploads/2017/03/compare1st-2ndlogon.png)

After the initial login, the next logins on the same desktop with the same user is comparable between the Windows 10 1607 version and the LTSB version. The difference in initial login duration could be caused by the Windows Store apps, as it is one of the differences between the CB and the LTSB version.

## Windows Store/Modern Apps

If you decide to use the Current Branch version, but you don&#8217;t want the Windows store/modern apps, you can remove them with the <a href="https://blogs.technet.microsoft.com/mniehaus/2015/11/11/removing-windows-10-in-box-apps-during-a-task-sequence/" target="_blank">powershell-script</a> created by Michael Niehaus (there is a <a href="https://msdnshared.blob.core.windows.net/media/TNBlogsFS/prod.evol.blogs.technet.com/telligent.evolution.components.attachments/01/5209/00/00/03/65/69/57/RemoveApps.zip" target="_blank">downloadlink for version 1.2</a>). There are other scripts available, but this one works good for me. You can remove all modern apps, or create a XML-file with a selection. I removed all the apps:

[<img class="aligncenter wp-image-22520" src="https://svenhuisman.com/wp-content/uploads/2017/03/remove-apps.png" alt="" width="461" height="494" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/remove-apps.png 597w, https://svenhuisman.com/wp-content/uploads/2017/03/remove-apps-326x350.png 326w" sizes="(max-width: 461px) 100vw, 461px" />](https://svenhuisman.com/wp-content/uploads/2017/03/remove-apps.png)

Even the Windows Store is gone! Only the Edge browser remains (and &#8220;Contact Support&#8221;). There is no Windows store in the LTSB version, so I only performed the login tests with the CB-version:

[<img class="aligncenter size-full wp-image-22529" src="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-removeapps-firstlogon1.png" alt="" width="842" height="324" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-removeapps-firstlogon1.png 842w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-removeapps-firstlogon1-350x135.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-removeapps-firstlogon1-768x296.png 768w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-removeapps-firstlogon1-650x250.png 650w" sizes="(max-width: 842px) 100vw, 842px" />](https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-removeapps-firstlogon1.png)

Average login duration is 17.66 seconds. Still more than 2 seconds slower than the LTSB version, but 8 seconds faster than the CB- version with Windows Store Apps.

Logon duration:

[<img class="aligncenter size-full wp-image-22522" src="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-removeapps-firstlogon2.png" alt="" width="724" height="317" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-removeapps-firstlogon2.png 724w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-removeapps-firstlogon2-350x153.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-removeapps-firstlogon2-650x285.png 650w" sizes="(max-width: 724px) 100vw, 724px" />](https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-removeapps-firstlogon2.png)

Logon per section:

[<img class="aligncenter size-full wp-image-22524" src="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-removeapps-firstlogon3-1.png" alt="" width="550" height="262" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-removeapps-firstlogon3-1.png 550w, https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-removeapps-firstlogon3-1-350x167.png 350w" sizes="(max-width: 550px) 100vw, 550px" />](https://svenhuisman.com/wp-content/uploads/2017/03/2vCPU-removeapps-firstlogon3-1.png)

So far part 2 of this series. Stay tuned for part 3 where I investigate more optimizations. Let&#8217;s see if I can get under 10 seconds. 🙂