---
id: 386
title: 'XenApp 5.0 &#8211; First Impression'
date: 2008-09-17T11:09:31+02:00
author: Matthijs Haverink
layout: post
guid: http://virtualfuture.info/?p=386
permalink: /2008/09/xenapp-50-first-impression/
categories:
  - Virtual Applications
tags:
  - Citrix
  - first impression
  - review
  - XenApp
---
Last week I&#8217;ve been testing with the new version of XenApp (Formerly known as Presentation Server). First thing that different from the Technical Preview was the ease of installation on a Windows Server 2008. All components (except for Sun Java) install automatically. Next thing that&#8217;s a big difference is the occurance of the Web Interface, Black, very Black and very good looking.

[<img class="size-medium wp-image-390 alignnone" src="https://svenhuisman.com/wp-content/uploads/2008/09/citrixlogin-300x113.jpg" alt="Citrix WI Login" width="300" height="113" />](https://svenhuisman.com/wp-content/uploads/2008/09/citrixlogin.jpg)

I&#8217;ve created a dual mode streaming site to be able to test the new Isolation 3.0 features. Best improvement is <!--more-->the ability to link application profiles to each other. This way I don&#8217;t have to install Microsoft Office on all my Citrix Servers. I&#8217;ve linked my office profile to my visio profile and to my amazement I was able to create a visio object in my word document in a very smooth and quick way. 

[<img class="alignnone size-medium wp-image-391" src="https://svenhuisman.com/wp-content/uploads/2008/09/linking-profiles-300x192.jpg" alt="" width="300" height="192" />](https://svenhuisman.com/wp-content/uploads/2008/09/linking-profiles.jpg)

One point of comment is still the presense of two management consoles. I still have to create my policy&#8217;s in the XenApp Advanced Administration Console. Although these are settings that don&#8217;t change very often it would be nice if they were integrated in the Advanced Management Console aswell. Another point of comment is the installation procedure on a Windows Server 2003. First install XenApp 4.5 and then Upgrade? Weird!!!!

Further on XenApp 5.0 is pretty much the same as XenApp (Presentation Server) 4.5.  A short list of first impression changes is:

&#8211; Change of the Web Interface theme

&#8211; Support for Windows 2008 Server

&#8211; Linking Streamed Profiles

&#8211; Preferential Load Balancing (with two servers wasn&#8217;t it a very impressive test 🙂 )

In the Platinum edition the new version of Edgesight is included aswell, the interface of this product has had a facelift aswell. This makes the tool more organised and easier to work with.

When I&#8217;ve worked with XenApp 5 in a bigger environment I&#8217;ll write a review of the product and can tell you more about perfomance in a live environment.