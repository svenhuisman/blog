---
id: 15480
title: VMware AirWatch and the .NET Framework mystery
date: 2016-06-23T15:19:12+02:00
author: Sven Huisman
layout: post
guid: http://SvenHuisman.com/?p=15480
permalink: /2016/06/vmware-airwatch-and-the-net-framework-mystery/
categories:
  - Enterprise Mobility
tags:
  - ACC
  - AirWatch
  - Cloud Connector
---
[<img class="alignnone wp-image-15488 size-full" src="https://svenhuisman.com/wp-content/uploads/2016/06/marketplace-vmw-aw-logo.png" alt="VMware AirWatch" width="300" height="160" />](https://svenhuisman.com/wp-content/uploads/2016/06/marketplace-vmw-aw-logo.png)

I recently had to reinstall the AirWatch Cloud Connector (ACC) at a customer. The ACC was installed on the AirWatch Console server (on-premises installation). The reason that I needed to reinstall the ACC was because of the need for additional services that needed to use the ACC and were disabled. You can’t just enable the services, you also have to reinstall the ACC after enabling services.  
So first step is to enable the required services:

  * System / Enterprise Integration / Cloud Connector -> Advanced
  * Enable the services
  * [<img class="aligncenter wp-image-15482 size-large" src="https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.20.28-983x1024.png" alt="Services" width="650" height="677" srcset="https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.20.28-983x1024.png 983w, https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.20.28-336x350.png 336w, https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.20.28-768x800.png 768w, https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.20.28-650x677.png 650w, https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.20.28.png 1102w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.20.28.png)Download the ACC:

[<img class="aligncenter size-medium wp-image-15483" src="https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-14.04.17-350x186.png" alt="Download ACC" width="350" height="186" srcset="https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-14.04.17-350x186.png 350w, https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-14.04.17-768x408.png 768w, https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-14.04.17-650x345.png 650w, https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-14.04.17.png 930w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-14.04.17.png)  
After removing the ACC from the server I started the Cloud Connector installer. The first thing the installer checks is if .NET Framework 4.5.2 is installed. If it’s not, it will download it and install it:

[<img class="aligncenter wp-image-15484 size-large" src="https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.44.26-1024x783.png" alt="Pending install .NET" width="650" height="497" srcset="https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.44.26-1024x783.png 1024w, https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.44.26-350x268.png 350w, https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.44.26-768x588.png 768w, https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.44.26-650x497.png 650w, https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.44.26.png 1030w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.44.26.png)

  * Installing .NET Framework 4.5.2:

[<img class="aligncenter wp-image-15485 size-large" src="https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.44.43-1024x783.png" alt="Installing .NET" width="650" height="497" srcset="https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.44.43-1024x783.png 1024w, https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.44.43-350x268.png 350w, https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.44.43-768x588.png 768w, https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.44.43-650x497.png 650w, https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.44.43.png 1030w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.44.43.png)

  * And then the installation failed:

[<img class="aligncenter wp-image-15486 size-full" src="https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.47.12.png" alt=".NET Failed" width="964" height="346" srcset="https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.47.12.png 964w, https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.47.12-350x126.png 350w, https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.47.12-768x276.png 768w, https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.47.12-650x233.png 650w" sizes="(max-width: 964px) 100vw, 964px" />](https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-23-at-13.47.12.png)

The reason that the installation failed was the fact that .NET Framework 4.6.1 was installed on the server (as a Windows update installed through WSUS). When .NET Framework 4.6.1 is already installed, .NET Framework 4.5.2 obviously cannot be installed anymore.

To be able to (re)install the ACC, remove the .NET Framework update from the server:

  * Remove “Update for Microsoft Windows (KB3102467)

[<img class="aligncenter wp-image-15481 size-large" src="https://svenhuisman.com/wp-content/uploads/2016/06/Uninstall_net461-1024x591.png" alt="Uninstall _net461" width="650" height="375" srcset="https://svenhuisman.com/wp-content/uploads/2016/06/Uninstall_net461-1024x591.png 1024w, https://svenhuisman.com/wp-content/uploads/2016/06/Uninstall_net461-350x202.png 350w, https://svenhuisman.com/wp-content/uploads/2016/06/Uninstall_net461-768x443.png 768w, https://svenhuisman.com/wp-content/uploads/2016/06/Uninstall_net461-650x375.png 650w, https://svenhuisman.com/wp-content/uploads/2016/06/Uninstall_net461.png 1071w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2016/06/Uninstall_net461.png)

Reboot the server and now you can install the ACC, because the installer will detect the .NET Framework 4.5.2 installation.

However, after removing the .NET Framework 4.6.1 update I noticed that the Console interface (which is installed on the same server) didn’t work anymore. After launching a browser and typing the URL of the Console, the following error showed up: Server Error in &#8216;/AirWatch&#8217; Application. Method not found:&#8230;

[<img class="aligncenter wp-image-15487 size-large" src="https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-22-at-11.13.11-1024x462.png" alt="Console error" width="650" height="293" srcset="https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-22-at-11.13.11-1024x462.png 1024w, https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-22-at-11.13.11-350x158.png 350w, https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-22-at-11.13.11-768x346.png 768w, https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-22-at-11.13.11-650x293.png 650w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2016/06/Screen-Shot-2016-06-22-at-11.13.11.png)

The only way I found to fix this is to reinstall the .NET Framework 4.6.1 update (NDP461-KB3102436-x86-x64-AllOS-ENU.exe). After reinstalling the Console worked as expected.

Please note that the ACC auto-update feature will not function correctly when .NET Framework 4.6.1 is installed. The ACC server installer requires .NET Framework 4.5.2. So for a next upgrade, you have to do the same trick.  
My advice: make sure .NET Framework 4.6(.1) is not installed on any AirWatch server!