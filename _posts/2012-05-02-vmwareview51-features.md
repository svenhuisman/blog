---
id: 2319
title: VMware View 5.1 new features highlighted
date: 2012-05-02T21:43:52+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=2319
permalink: /2012/05/vmwareview51-features/
categories:
  - Virtual Desktop
tags:
  - "1"
  - End User Computing
  - View
  - View 5
  - VMware
---
Today VMware announced VMware View 5.1. A lot of great new features in this update. In this blogpost I was going to highlight the new features of this release but that has already been done a lot by other bloggers. Instead, I will highlight a couple of the new features and dive a little deeper. First of all, if you haven’t read about the new features, here are a couple of links where you can read all about them:

  * <a href="http://blogs.vmware.com/euc/2012/05/whats-new-in-view-51.html" target="_blank">VMware EUC blog: What’s New in VMware View 5.1</a>
  * <a href="http://www.vmware.com/files/pdf/press-kit/vmware-view-51-media-backgrounder.pdf" target="_blank">VMware View 5.1 press media backgrounder</a>
  * <a href="http://blogs.vmware.com/euc/2012/05/optimizing-storage-with-view-storage-accelerator.html" target="_blank">VMware View, optimizing storage with View storage accelerator</a>
  * <a href="http://blogs.vmware.com/euc/2012/05/demystifying-vmware-view-large-scale-designs.html" target="_blank">VMware View, demystifying VMware View Large Scale Designs</a>
  * <a href="http://www.ntpro.nl/blog/archives/2038-VMware-has-announced-VMware-View-5.1.html" target="_blank">NTPRO.NL: VMware View 5.1 announcement</a>
  * <a href="http://blogs.vmware.com/euc/2012/05/view-composer-array-integration-tech-preview.html" target="_blank">VMware EUC Portfolio: View Composer Array Integration Tech Preview</a>

Reading these posts will get you up to speed. General availability of VMware View 5.1 will be in Q2 of 2012.

Here are the things to keep in mind when implementing or upgrading to VMware View 5.1:

<!--more-->

**View storage accelerator**

The View storage accelerator is the best new feature in my opinion. This is the name for a feature which is included in vSphere 5 (Content Based Read Cache) but now managed by View. It is a very cool feature that will offload the peak IOPS on the storage. It will offload READ-IOPS, this means it will be mostly used during a boot-storm and during login-storms. It is very useful for shared disks such as View Composer OS disks but it will also work for full clones. The host cache limit size is 2048 MB and the generation of the cache can cost some CPU and IOPS. It is recommended to set blackout times; during this time no caching operation takes place.

**[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="cache" src="https://svenhuisman.com/wp-content/uploads/2012/05/cache_thumb.png" border="0" alt="cache" width="475" height="296" />](https://svenhuisman.com/wp-content/uploads/2012/05/cache.png)**

**Newly implemented USB redirection stack**

The USB stack included with View 5.1 has a new architecture. This means that the vast majority of existing USB devices will now connect to View without issue. It has improved device handling, for example: claim in-use device, auto-forwarding after device reset, etc. That having said, I advise you to test the new USB redirection with all your USB devices. New technologies will come with new issues<img class="wlEmoticon wlEmoticon-winkingsmile" style="border-style: none;" src="https://svenhuisman.com/wp-content/uploads/2012/05/wlEmoticon-winkingsmile.png" alt="Winking smile" /> . The new USB redirection is only implemented in the Windows client and with be added to other clients at a later time.

**Persona Management Migration tools**

With View 5.1 you are now allowed to the  install Persona management agent on a physical computer. This allows you to migrate user profiles from a physical XP desktop to a virtual Windows 7 desktop for example. Personally I recommend to start with clean user profiles, but I can imagine you want to save certain files or settings from the user’s old profile (favorites, my documents).

**SSL certificates**

View 5.1 implements strict security settings and enforce SSL certificate validation by default. This means that every component needs a valid SSL certificate:

  * View Connection server
  * View Composer
  * vCenter Server
  * View transfer server
  * View security server

In View 5.0 or earlier, the view security server already has a valid SSL certificate (it should have). For the other components a self-signed certificate is used most of the times. In VMware View 5.1 it is highly recommended to use valid certificates for all the components mentioned. The easiest way to accomplish this is to install the Active Directory Certificate Services. The View client can now only communicate using HTTPS. Also, legacy View Clients prior to 5.0 (4.6 and previous versions) are not compatible with View 5.1 Connection Server.

**Radius support**

Finally there is RADIUS support in VMware View! Until now we only had the option of using RSA authentication or smartcard to use 2-factor authentication. In View 5.1, RADIUS support is added. Unfortunately, the feature included in View only supports basic RADIUS, no advanced features (yet). This doesn’t mean it doesn’t work with challenge response for example, but you will not have the option to label the entry forms correctly. For example, if you configure VMware View to use a SMS one time password (OTP) through RADIUS, you want the View client to present a login screen to enter the domain credentials. After the domain credentials are entered correctly, the user would get a SMS and the View client should present a field to enter the SMS code. If you look at the following screen, the user gets a prompt to first enter “Cryptocard” user name and passcode, but instead, the user needs to enter the domain credentials.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="3" src="https://svenhuisman.com/wp-content/uploads/2012/05/3_thumb.png" border="0" alt="3" width="244" height="165" />](https://svenhuisman.com/wp-content/uploads/2012/05/3.png)

The next screen shows a correct form:

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="4" src="https://svenhuisman.com/wp-content/uploads/2012/05/4_thumb.png" border="0" alt="4" width="244" height="148" />](https://svenhuisman.com/wp-content/uploads/2012/05/4.png)

In a next blogpost, I will explain two different configurations to use Cryptocard 2 factor authentication.

**Standalone View Composer server**

It is now possible to install the VMware View Composer on a standalone server. This means you don’t have to install it on a vCenter server anymore. Keep in mind that the View Composer server still has a one-to-one relation with a vCenter server. Another thing to keep in mind that you can’t install the View Composer server on a View Connection server. For now I recommend to install the View Composer on the vCenter server. The possibility to separate these services is good, because this will make it possible

to use the vCenter virtual appliance in the near future. For now, the View composer is not supported to work with the vCenter virtual appliance.

**Event logging into syslog**

In this release it is possible to log events to a syslog server. Unfortunately, there is no GUI to enable event syslog. The command to configure Event Syslog is:

vdmadmin -l -eventSyslog -enable –localOnly

or for an external syslog server:

vdmadmin -l -eventSyslog -enable -path path -user mydomain\myuser -password mypassword

The command to disable eventsyslog is:

vdmadmin -l eventSyslog –disable

Only on one connection server to affect all.

These are a couple of the new features. In the upcoming weeks, I will blog more about this new release.