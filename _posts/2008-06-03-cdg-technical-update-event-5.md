---
id: 10
title: CDG Technical Update Event 5
date: 2008-06-03T22:35:01+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=10
permalink: /2008/06/cdg-technical-update-event-5/
comment_count:
  - "1"
trackback_count:
  - ""
categories:
  - Virtualization news
tags:
  - CDG
  - Installfree
  - Site Recovery Manager
  - SRM
  - vCharter
  - Vizioncore
  - VMware
  - vRanger
  - vReplicatior
---
This afternoon I visited the <a title="CDG TUE 5" href="http://www.cdg.nl/evenementen.asp?level=864&864=1400" target="_blank">5th Technical Update Event</a> organized by CDG, a dutch distributor and training company of VMware, Citrix, RES and more. At these events, there are allways 3 products presented or technically explained. This time the following products were presented:

  * <a title="InstallFree" href="http://www.installfree.com" target="_blank">InstallFree</a>
  * <a title="Vizioncore vEssentials" href="http://vizioncore.com/vEssentials.html" target="_blank">Vizioncore vEssentials</a>
  * <a title="VMware Site Recovery Manager" href="http://vmware.com/products/srm/" target="_blank">VMware Site Recovery Manager</a>

<!--more-->The Installfree presentation was okay. A colleague told me about this new Application virtualization product and he was very enthousiastic about it. I attended a webinar a couple of weeks ago, and it couldn&#8217;t impress me a lot. This time the presentation impressed me more.

InstallFree has 2 main products, InstallFree Bridge and InstallFreeDesktop. Bridge is for application streaming and Desktop is for presenting a shell to the user with applications. Both can be made available offline. Besides that, there is the Encapsulator (the one that actually packages the applications) which uses a mini-OS, so you don&#8217;t need a clean PC to package applications. The applications will use this mini-OS. None of the products are released yet, but are soon to be.

The advantages are:

  * Ease of administration. You can give users, groups or OU&#8217;s rights to applications, plugins or even updates.
  * Virtualized applications can interact with each other, for example: in the demo Excel 2002 was integraded in Word 2007.
  * Application can be streamed over HTTP(S).
  * Integration with the desktop.
  * User data is sync&#8217;d. 

As I said, I was impressed. But as a VMware-fan, I&#8217;m really looking forward to VMware&#8217;s Application Virtualization sollution <a title="VMware Thinstall" href="http://www.vmware.com/whatsnew/thinstall.html" target="_blank">Thinapp</a> (the <a title="New name for Thinstall" href="http://c1tr1xguru.wordpress.com/2008/05/07/thinstall-is-nowthinapp/" target="_blank">new name</a> for Thinstall). This will also feature dynamic linking between virtual packages. I haven&#8217;t seen the latest beta, but I will try it soon.

Next up was Vizioncore. vEssentials is a bundle of 3 products:

  * vRanger Pro &#8211; Backup
  * vReplicator &#8211; Replicate VM to other destination(s)
  * vCharter &#8211; Monitoring

I had heared from these products in the past, but never used them. From what I saw today there are some of the features that these products have I&#8217;d like to see in the next release of VMware 🙂 :

  * vRanger and vReplicator uses VSS (Volume Shadow copy Service). The presenter claimed that vizioncore was unique on the market with this feature. 
  * vCharter has a lot of must-haves like: alerting on things you really want to now (VMkernel swap for example) and trend-analyses. Click <a title="vCharter" href="httphttp://vizioncore.com/Videos/vCharterOverviewVideo.html" target="_blank">here</a> for a video.

Final was VMware with Site Recovery Manager. There a already a lot of things said about this new product, but here are 2 points that I want to mention:

  * SRM is said to be released on June 19th 2008.
  * SRM 1.0 version is not able to failback after a site-failover. You can do it, but you have to manually reconfigure a failover the other way around.

Afterwards there was junkfood and we got a goodie-bag. I couldn&#8217;t stay for the food, but the goodie-bag was okay:

  * 1 GB VMware USB-key
  * a mini-mouse from vizioncore with automatic rollup cord
  * a little lamp-key-thing from vizioncore (useless)
  * Evaluation CD from Platespin
  * Mini noteblock from Vizioncore
  * a Vizioncore pen

Update: presentations can be downloaded <a title="Presentation TUE5" href="http://www.cdg.nl/media/presentaties/tue5_ppt.zip" target="_blank">here</a>.