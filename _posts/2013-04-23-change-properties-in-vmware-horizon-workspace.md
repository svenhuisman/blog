---
id: 2538
title: Change properties in VMware Horizon Workspace
date: 2013-04-23T15:36:29+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=2538
permalink: /2013/04/change-properties-in-vmware-horizon-workspace/
categories:
  - Enterprise Mobility
tags:
  - Horizon
  - VMware
  - Workspace
---
The following error appeared in the VMware Horizon Configurator Webpage after I upgraded vCenter 5.0 to vCenter 5.1:

[<img class="alignnone size-medium wp-image-2542" alt="vc-error" src="https://svenhuisman.com/wp-content/uploads/2013/04/vc-error-350x87.png" width="350" height="87" srcset="https://svenhuisman.com/wp-content/uploads/2013/04/vc-error-350x87.png 350w, https://svenhuisman.com/wp-content/uploads/2013/04/vc-error.png 1005w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2013/04/vc-error.png)

_Error detail: Cannot login to vCenter Server. Please confirm vCenter Server is running. See catalina.out log for the full stack trace._

I can explain this because during installation of Horizon Workspace I didn&#8217;t add the domain to the account when I entered the vCenter credentials. After I upgraded vCenter to 5.1 and installed the SSO service, users can only log on when the domain is also specified. When I searched on how to change this settings, the documentation of VMware Horizon Workspace didn&#8217;t help me out. But there is on command you can use on the Configurator VM which allows you to change certain settings.

First, list the current settings with:

hznAdminTool editproperty &#8211;list

[<img class="alignnone size-medium wp-image-2544" alt="list config" src="https://svenhuisman.com/wp-content/uploads/2013/04/list-config1-350x93.png" width="350" height="93" srcset="https://svenhuisman.com/wp-content/uploads/2013/04/list-config1-350x93.png 350w, https://svenhuisman.com/wp-content/uploads/2013/04/list-config1.png 504w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2013/04/list-config1.png)

Then, edit the property you would like to change. In my case, the &#8220;vim_username&#8221; was set to <username> and had to be edited to <username@domain>:

hznAdminTool editproperty &#8211;set=vim_username:<username@domain>

[<img class="alignnone size-medium wp-image-2543" alt="editconfig" src="https://svenhuisman.com/wp-content/uploads/2013/04/editconfig1-350x25.png" width="350" height="25" srcset="https://svenhuisman.com/wp-content/uploads/2013/04/editconfig1-350x25.png 350w, https://svenhuisman.com/wp-content/uploads/2013/04/editconfig1.png 726w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2013/04/editconfig1.png)

Then restart the configurator-tc service:

service configurator-tc restart

[<img class="size-medium wp-image-2541 alignnone" alt="restart" src="https://svenhuisman.com/wp-content/uploads/2013/04/restart-350x195.png" width="350" height="195" srcset="https://svenhuisman.com/wp-content/uploads/2013/04/restart-350x195.png 350w, https://svenhuisman.com/wp-content/uploads/2013/04/restart.png 721w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2013/04/restart.png)

And we&#8217;re up and running again!

&nbsp;