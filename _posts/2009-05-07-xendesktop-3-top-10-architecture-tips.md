---
id: 1152
title: XenDesktop 3 Top 10 Architecture Tips
date: 2009-05-07T04:32:40+02:00
author: Matthijs Haverink
layout: post
guid: https://svenhuisman.com/?p=1152
permalink: /2009/05/xendesktop-3-top-10-architecture-tips/
categories:
  - Citrix Synergy 2009
---
yesterday I attended the&#8221;Citrix XenDesktop 3 Architecture&#8221; technical session. This session was a very useful session because it gives a lot of useful tips to design a XenDesktop environment.

I&#8217;ll give you a top ten of tips for using in a design:

1 &#8211; Make sure you&#8217;re using Provisioning Server (included in Platinum edition) to save on storage costs, and desktop maintenance costs

2 &#8211; Invest in solid hardware capable of running a Server virtualization platform (XenServer &#8211; preferred ;), VMware, Hyper-V) with sufficient resources (Lots of memory and CPU)

3 &#8211; Calculate up-front how many users are using a complete desktop ate the same time<!--more-->

4 &#8211; Define user groups up-front into Task Workers (same thing everyday with same software) and Knowledge workers (variable software with variable resource needs)

5 &#8211; Create a simple architecture defining a maximum of 3 images per OS

6 &#8211; Provide your applications your desktops using application delivery technology (XenApp &#8211; preferred ;), Softgris, Installfree)

7 &#8211; Calculate how many users will login simultaneously (this will make the creation of Pools easier)

8 &#8211; Use Workflow studio to provision more desktops when needed (this will maybe make your design up-front more difficult but it will save costs on the longer term)

9 &#8211; Create solid procedures around the desktop lifecycle to make sure you only provide the right amount of vm&#8217;s

10 &#8211; Use a solid workspace management system to make sure users get the right applications and settings in the right environment (RES Powerfuse is a good example)

I hope this will help you build a solid and fast XenDesktop VDI environment. Please comment is I forget something or you have additional tips.