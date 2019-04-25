---
id: 3965
title: Disable App Volumes service before updating OS or installed apps
date: 2015-05-21T16:53:06+02:00
author: Sven Huisman
layout: post
guid: https://SvenHuisman.com/?p=3965
permalink: /2015/05/disable-app-volumes-service-before-updating-os-or-installed-apps/
categories:
  - Virtual Desktop
---
When you use VMware App Volumes to provision your applications to your RDSH-VMs, how do you keep you&#8217;re Windows OS and locally installed applications up to date? As you can not use Horizon Composer (yet) to update RDS-hosts with a new image, you should still use a tool like Microsoft System Center Configuration Manager (SCCM) to install Windows updates and update locally installed applications. In a demo-environment I recently installed Windows updates through the Windows updates service, but as the App Volumes service was still running and there were AppStacks attached to the machine, this did&#8217;t work as expected. I installed 36 new Windows updates, but after a reboot and a scan for new updates, the message appeared that there were still 36 updates available:

[<img class="aligncenter  wp-image-3966" src="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-21-at-13.08.44.png" alt="Windows updates" width="350" height="190" srcset="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-21-at-13.08.44.png 612w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-21-at-13.08.44-350x190.png 350w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-21-at-13.08.44.png)

At first, I installed the updates again, but after a reboot, still the same updates available. After stopping the App Volumes service and disabling it I installed the updates again. This time the updates were successfully installed. After a reboot, I enabled the App Volumes service again and rebooted the server, so the AppStacks would be attached to the server again.

I have not tested this with unattended installation of updates (with SCCM for example), but I expect that you could run into the same issue.

So lessons learned: if using a persistent image (like my RDSH-VMs) with App Volumes read-only Appstacks attached, disable the App Volumes service before updating the OS or installed applications.

I hope VMware will soon allow cloning of RDSH-VMs with Horizon Composer or instant cloning technology.