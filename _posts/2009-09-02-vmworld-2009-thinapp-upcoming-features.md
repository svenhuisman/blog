---
id: 1402
title: 'VMworld 2009: ThinApp upcoming features'
date: 2009-09-02T01:56:08+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=1402
permalink: /2009/09/vmworld-2009-thinapp-upcoming-features/
categories:
  - Virtual Applications
  - VMworld 2009 SF
tags:
  - Thinapp
  - ThinstallHelper
  - VMware
  - VMworld 2009
---
Today I went to a session about upcoming features for ThinApp. Some interesting features were shown and I will discuss those in this post:

**Protocol Handlers**:  
Protocols are things like http: and mailto:  
ThinApp recognizes protocols during capture and includes information in package.ini<!--more-->

Example for Outlook 2007  
Protocols=feed;feeds;mailto;Outlook.URL.feed;Outlook.URL.mailto;  
Outlook.URL.stssync;Outlook.URL.webcal;outlookfeed;outlookfeeds;  
stssync;webcal;webcals

When applications are registered on a desktop via thinreg or .msiwrapper, protocols will be registered.

**New management SDK**:  
&#8211; Open thinApp package files  
&#8211; Query registry key values  
&#8211; Open file version information from internal EXE  files  
&#8211; Obtain a list of files, sizes and attributes

**VMware ThinApp autopackager:  
** The autopackager was really cool. It can automatically create ThinApp packages of a bunch of applications. What it does is:

&#8211; Startup VM&#8217;s on ESX  
&#8211; Takes snapshot  
&#8211; Package software  
&#8211; Copy Project-folder

It packages multiple applications simultaneously (depending on the number of VM&#8217;s) and the demo showed 13 applications ThinApped in 30 minutes (including Office 2003, which took the longest).

Windows 7 support will probably in the beta release coming this November. GA will be Q1 2009.

What was also pretty cool was the fact that <a title="thinstallhelper" href="http://thinstallhelper.cis-group.nl/" target="_blank">Thinstall-helper</a> was mentioned during the presentation. I once worked on a ThinApp project together with the developer of Thinstallhelper. The funny thing was that in the presentation it was called ThinApphelper, including a screenshot.