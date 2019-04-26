---
id: 2467
title: 'VMware View Manager &#8220;The service is not working properly.&#8221;'
date: 2012-11-20T22:30:09+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=2467
permalink: /2012/11/vmware-view-manager-the-service-is-not-working-properly/
categories:
  - Virtual Desktop
tags:
  - View 5.1
  - VMware
  - VMware View
---
I was building a new VMware View 5.1 environment and I experienced an issue I want to share. I think this is not documented correctly right now in the View 5.1 documentation.

**Situation**:

I have 2 View Connection servers 5.1.1 (VCS01 and VCS02) and 1 VMware vCenter 5.0 u1 (VC01). The vCenter server is added to the View configuration and is working without a problem. I don&#8217;t use Composer in this configuration and I have a valid SSL certificate installed on all 3 servers.

**Issue**:

I logged on to the View administrator console of VCS01 and I changed host caching of the vCenter server setting in &#8220;View Configuration\Servers\vCenter servers&#8221;. I changed the following setting: &#8220;Override default host cache size&#8221; :

[<img class="size-medium wp-image-2469 alignnone" title="Screen Shot 2012-11-20 at 9.11.28 PM" src="https://svenhuisman.com/wp-content/uploads/2012/11/Screen-Shot-2012-11-20-at-9.11.28-PM-312x350.png" alt="" width="312" height="350" srcset="https://svenhuisman.com/wp-content/uploads/2012/11/Screen-Shot-2012-11-20-at-9.11.28-PM-312x350.png 312w, https://svenhuisman.com/wp-content/uploads/2012/11/Screen-Shot-2012-11-20-at-9.11.28-PM-913x1024.png 913w, https://svenhuisman.com/wp-content/uploads/2012/11/Screen-Shot-2012-11-20-at-9.11.28-PM.png 1028w" sizes="(max-width: 312px) 100vw, 312px" />](https://svenhuisman.com/wp-content/uploads/2012/11/Screen-Shot-2012-11-20-at-9.11.28-PM.png)

The service of vCenter server turned red in the View admin dashboard with status: &#8220;The service is not working properly&#8221;. This happens a couple of minutes later.

[<img class="alignnone size-medium wp-image-2468" title="error" src="https://svenhuisman.com/wp-content/uploads/2012/11/error-350x223.png" alt="" width="350" height="223" srcset="https://svenhuisman.com/wp-content/uploads/2012/11/error-350x223.png 350w, https://svenhuisman.com/wp-content/uploads/2012/11/error.png 642w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2012/11/error.png)

In the logfile of one of the connection servers I saw the following error:

714f2e-55dd-48b3-8a39-ac825f59a6cd-1352984469542> [Audit] VC_OUTAGE:Url:[https://vc01.domainname.x:443/sdk](https://vc01.domainname.x/sdk)  
2012-11-15T14:11:24.493+01:00 WARN  (0AFC-0100) [ServiceConnection25] VirtualCenter [https://vc01.domainname.x:443/sdk](https://vc01.domainname.x/sdk) is currently unavailable &#8211; attempting to reconnect  
2012-11-15T14:11:25.960+01:00 WARN  (0AFC-0100) [ServiceConnection25] Problem while performing VC operation: &#8216;Permission to perform this operation was denied.&#8217; [com.vmware.vim25.NoPermission]  
2012-11-15T14:11:25.984+01:00 INFO  (0AFC-0100) [Audit] VC_OUTAGE:Url:[https://vc01.domainname.x:443/sdk](https://vc01.domainname.x/sdk)  
2012-11-15T14:11:25.984+01:00 WARN  (0AFC-0100) [ServiceConnection25] VirtualCenter [https://vc01.domainname.x:443/sdk](https://vc01.domainname.x/sdk) is currently unavailable &#8211; attempting to reconnect  
2012-11-15T14:11:25.985+01:00 WARN  (0AFC-0100) [ServiceConnection25] Previous VC reconnection attempt didn&#8217;t work, will wait before attempting again.  
2012-11-15T14:11:41.111+01:00 WARN  (0AFC-0100) [ServiceConnection25] No permission to perform VC operation.  
2012-11-15T14:11:42.566+01:00 WARN  (0AFC-0100) [ServiceConnection25] Problem while performing VC operation: &#8216;Permission to perform this operation was denied.&#8217; [com.vmware.vim25.NoPermission]

I posted my issue in the VMware communities forum and luckily someone pointed me in the right direction. It seems the documentation is not complete when it comes to user rights for the vCenter user. According to the documentation, you need certain rights in vCenter to get VMware View work correctly. One of the new rights in mentioned in the View 5.1 documentation is: &#8220;Global \ Act as vCenter server&#8221;

_The following privilege is required to implement ESXi host caching in View. If you do not use host caching, the vCenter Server user does not need this privilege._

Apparently, if you want to change the host cache on a per host level, you need additional rights in vCenter:

Host \ Configuration \ Advanced settings

[<img class="alignnone size-medium wp-image-2470" title="Screen Shot 2012-11-20 at 9.27.28 PM" src="https://svenhuisman.com/wp-content/uploads/2012/11/Screen-Shot-2012-11-20-at-9.27.28-PM-261x350.png" alt="" width="261" height="350" srcset="https://svenhuisman.com/wp-content/uploads/2012/11/Screen-Shot-2012-11-20-at-9.27.28-PM-261x350.png 261w, https://svenhuisman.com/wp-content/uploads/2012/11/Screen-Shot-2012-11-20-at-9.27.28-PM-764x1024.png 764w, https://svenhuisman.com/wp-content/uploads/2012/11/Screen-Shot-2012-11-20-at-9.27.28-PM.png 880w" sizes="(max-width: 261px) 100vw, 261px" />](https://svenhuisman.com/wp-content/uploads/2012/11/Screen-Shot-2012-11-20-at-9.27.28-PM.png)