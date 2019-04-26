---
id: 270
title: XenApp 5.0 (release Sept. 10th) also available on W2K3
date: 2008-08-26T11:53:01+02:00
author: Matthijs Haverink
layout: post
guid: https://svenhuisman.com/?p=270
permalink: /2008/08/xenapp-50-release-sept-10th-also-available-on-w2k3/
categories:
  - Virtualization news
tags:
  - ActiveSync Support
  - Citrix
  - comparison
  - Isolation 3.0
  - Matthijs Haverink
  - NDS Support
  - RADIUS support
  - release date
  - streaming
  - W2K3
  - W2K8
  - Windows Server 2003
  - Windows Server 2008
  - XenApp 5.0
---
**A**ccording <a href="https://www.thomaskoetzing.de/index.php?option=com_content&task=view&id=283&Itemid=254" target="_blank">to Thomas Koetzing</a> XenApp 5.0 will be released the 10th of September (and my hunch is that the software will be available even earlier!) and will also be available for Windows Server 2003! <a href="https://www.citrix.com" target="_blank">Citrix</a> always claimed that XenApp 5.0 would only be available on Windows Server 2008 and XenApp 4.5 would stay under development for Windows Server 2003. But Citrix came to their senses and realized that forcing their customers to move to W2K8 was not the way.

**S**o now the question is which OS are you going to choose? That&#8217;s something you can only decide when you know what&#8217;s new and which features will or will not work on a certain OS.

**Some new features (compared to CPS4.5) that are available both on W2K8 and W2K3:<!--more-->**

  * _Isolation 3.0 (Separate packaging and communication between isolated apps)_
  * _IPv6 Support (Enabling IPv6 clients)_
  * _RADIUS support for Web Interface_
  * _KERBEROS authentication for Web Interface_
  * _HTTP/S for Streaming_

**New features that are only available when running XenApp 5.0 on Windows Server 2008:**

  * _Special Folder Redirection (Enable special folders like &#8220;my docs&#8221; and &#8220;my pictures&#8221; to an ICA session automatically._
  * _XPS Universal Printer Driver (Microsoft&#8217;s new XML paper specification)_
  * _Preferred Load Balancing (Set priorities based on user, group  and application requirements)_

**Features that only work with XenApp 5.0 on Windows Server 2003:**

  * _ActiveSync support (syncing client based USB PDA&#8217;s)_
  * _NDS Support (Publishing apps and content to Novell NDS user and groups and also Seamless NDS authentication)._
  * _HP Protect Tool Support_

The sheet strangely enough says that XenApp 5.0 on Windows Server 2008 **does not have** Directory Support (Active Directory and Novell eDirectory) but I&#8217;m assuming that this is an mix-up in the sheet.

_**EDIT:** I just got off the phone with Tim Graf from Citrix and he assured me, as expected, that of course Active Directory is supported, but Novell eDirectory is not._

<a href="https://www.citrix.com/site/resources/dynamic/salesdocs/Citrix-XenApp-Comparative-Matrix%28Aug08%29.pdf" target="_blank">The full Citrix XenApp Comparative Feature Matrix can be found here.</a>