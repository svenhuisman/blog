---
id: 2591
title: Horizon Workspace ThinApp non-domain joined access
date: 2014-03-21T15:26:06+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=2591
permalink: /2014/03/horizon-workspace-thinapp-package-repository/
categories:
  - Workspace Management
tags:
  - Horizon
  - Thinapp
  - Workspace
---
With Horizon Workspace 1.8 it is now possible to allow non-domain joined machines to use ThinApp packages from Horizon Workspace. In previous versions, clients needed to be domain joined to start ThinApp applications from Workspace.

There is a new feature to enable this, called &#8220;**account-based access**&#8220;. This feature is enabled on the Connector-va on which the ThinApp synchronization is configured. As in previous versions, the ThinApp packages must reside on a network share, and this network share must be accessible using a Uniform Naming Convention (UNC) path from each system running the Workspace client used to access the ThinApp packages. This means that clients still needs to be connected to the LAN (or through VPN or Direct-Access for example). Once the ThinApp packages are locally cached (through the Workspace client), the ThinApps can also be used outside the LAN.

  * Login to the connector-va (https://connector-va:8443)
  * Go to &#8220;Packaged Apps > ThinApp&#8221;
  * Check &#8220;**Enable account based access**&#8220;:

[<img class="aligncenter size-medium wp-image-2594" alt="enable-access" src="https://svenhuisman.com/wp-content/uploads/2014/03/enable-access1-350x206.png" width="350" height="206" srcset="https://svenhuisman.com/wp-content/uploads/2014/03/enable-access1-350x206.png 350w, https://svenhuisman.com/wp-content/uploads/2014/03/enable-access1.png 1009w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2014/03/enable-access1.png)

&nbsp;

&nbsp;

  * Enter the share user and password and click &#8220;Save&#8221;:

[<img class="aligncenter size-medium wp-image-2593" alt="enable-access2" src="https://svenhuisman.com/wp-content/uploads/2014/03/enable-access2-350x92.png" width="350" height="92" srcset="https://svenhuisman.com/wp-content/uploads/2014/03/enable-access2-350x92.png 350w, https://svenhuisman.com/wp-content/uploads/2014/03/enable-access2.png 631w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2014/03/enable-access2.png)

&nbsp;

Account based access is now enabled. Users can now access ThinApp applications from Horizon Workspace from a non-domain joined computer with a Horizon Workspace client.

I hope that the next version of Horizon Workspace will enable streaming ThinApps through the Horizon Gateway-va, so user don&#8217;t need to be connected to the LAN.