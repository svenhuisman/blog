---
id: 23592
title: VMware Horizon 7.2 offers new helpdesk tool
date: 2017-06-20T19:01:23+02:00
author: Sven Huisman
layout: post
guid: https://SvenHuisman.com/?p=23592
permalink: /2017/06/vmware-horizon-7-2-offers-new-helpdesk-tool/
categories:
  - Virtual Desktop
tags:
  - Help desk
  - Horizon
  - Horizon 7
  - VMware
---
The recently released <a href="https://my.vmware.com/web/vmware/details?downloadGroup=VIEW-720-ENT&productId=654&rPId=16710" target="_blank">VMware Horizon 7.2</a> offers a couple of new features. One of them is a new helpdesk tool called Horizon Help Desk. This HTML5 webinterface is created for the helpdesk-employee to be able search for the user and see the sessions and the related information for that session(s). The current VMware Horizon Administrator console doesn&#8217;t offer the right functionality for  helpdesk-employees. It&#8217;s for creating and maintaining desktop and application pools, not to directly support a user.

On the server side it is an integrated install, leverages existing Webserver deployed with Horizon broker. On the Agent side, it is part of the Horizon-View Agent installer. It is complementary to vROPs for Horizon (which will give you historic, trending & reporting) and it is available as a feature of Horizon Enterprise Edition and Horizon Apps Advanced Edition.

So here is a look at Horizon Help Desk:

[<img class="aligncenter size-full wp-image-23593" src="https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-1.jpg" alt="" width="705" height="547" srcset="https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-1.jpg 705w, https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-1-350x272.jpg 350w, https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-1-650x504.jpg 650w" sizes="(max-width: 705px) 100vw, 705px" />](https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-1.jpg)

This webinterface is localized to languages Horizon supports. You can log in directly on the help desk URL or you can access the helpdesk tool through token-based SSO from the Horizon 7.2 admin console.

In the next screenshot, you can see that you can search for a user in the user look-up dashboard. You can search on Username and full name, incl. across Cloud Pod Architecture (global entitlement):

[<img class="aligncenter size-large wp-image-23594" src="https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-2-1024x366.jpg" alt="" width="650" height="232" srcset="https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-2-1024x366.jpg 1024w, https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-2-350x125.jpg 350w, https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-2-768x274.jpg 768w, https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-2-650x232.jpg 650w, https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-2.jpg 1192w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-2.jpg)

In the next screen you can see the current sessions of the user. The state shows if the user is connected (green) or disconnected. It also shows if it is a local entitlement (L) or global entitlement (G). Both RDSH and VDI sessions are supported.

[<img class="aligncenter size-large wp-image-23595" src="https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-3-1024x470.jpg" alt="" width="650" height="298" srcset="https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-3-1024x470.jpg 1024w, https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-3-350x161.jpg 350w, https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-3-768x352.jpg 768w, https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-3-650x298.jpg 650w, https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-3.jpg 1153w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-3.jpg)

After you select a session, you get more details about that session:

[<img class="aligncenter size-large wp-image-23596" src="https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-4-1024x494.jpg" alt="" width="650" height="314" srcset="https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-4-1024x494.jpg 1024w, https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-4-350x169.jpg 350w, https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-4-768x371.jpg 768w, https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-4-650x314.jpg 650w, https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-4.jpg 1156w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-4.jpg)

It will present real-time information with a 5 sec sample rate on CPU, Mem and Latency, with a 15 min session look back. The following information is available:

  * **Session details**: CPU, Mem, Latency, TX bandwidth, Packet Loss (PCoIP), Protocol, Session start time and duration, logon breakdown
  * **Client details**: client name, user, IP, OS
  * **Machine details**: Computer name, IP address, agent version, Pool/Farm, Pod and vCenter name

The session detail information is stored on the Horizon View agent. The resource overhead is ~20 MB memory and 5% CPU on the agent (max observed in testing).

In the following screen you can see that there are also actions that can be performed from Horizon Help Desk:

[<img class="aligncenter size-large wp-image-23597" src="https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-5-1024x494.jpg" alt="" width="650" height="314" srcset="https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-5-1024x494.jpg 1024w, https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-5-350x169.jpg 350w, https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-5-768x371.jpg 768w, https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-5-650x314.jpg 650w, https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-5.jpg 1158w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/06/helpdesktool-5.jpg)

The following actions are available:

  * Desktop actions: Send Message, Remote Assist (MS), Restart, Reset (hard), Disconnect, Log-off & Shutdown

## Enabling timing profiler

After installing or upgrading to Horizon 7.2 you need to make sure you meet the following requirements:

  * Horizon Enterprise edition license or Horizon Apps Advanced edition license for Horizon 7 version 7.2.
  * An event database to store information about Horizon 7 components.
  * Administrator role to login to Horizon Help Desk Tool.

You also need to enable the timing profiler on each Connection Server instance to view logon segments. Use the following vdmadmin command to enable the timing profiler on each Connection Server instance:

**vdmadmin -I -timingProfiler -enable**