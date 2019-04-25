---
id: 2237
title: VMware ThinApp Factory, Technical Preview
date: 2011-09-15T22:45:43+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=2237
permalink: /2011/09/vmware-thinapp-factory-technical-preview/
image: /wp-content/uploads/2011/09/1927-factory-workers.jpg
categories:
  - Virtual Applications
  - VMworld 2011 Vegas
tags:
  - Horizon App Manager
  - Thinapp
  - ThinApp Factory
  - VMworld 2011
---
At VMworld 2011 in Las Vegas I attended the Hands-on lab “Solving Application Management Challenges with Application Virtualization” (HoL23). A big part of this HoL is about ThinApp, from basic to more advanced. If you are going to Copenhagen and take this lab AND you already know ThinApp, I advise you to skip chapter 1 to 3 and start with chapter 4, because you don’t have time to complete the entire HoL(lab manual is 238 pages). Chapter 4 is about a technical preview of ThinApp Factory. To be clear, this was not even Beta code but I was already impressed by the product and the features it will have. Here is my impression of ThinApp Factory (with screenshots!).

<!--more-->

When you logon to the ThinApp Factory console through a webbrowser, the first thing you see is the ThinApp Factory Dashboard

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border-width: 0px;" title="ThinAppFactory-1" src="https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppFactory-1_thumb.jpg" border="0" alt="ThinAppFactory-1" width="583" height="344" />](https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppFactory-1.jpg)

The next thing you want to do is to add a File share or Feed to the application sources. In this location the source files are located that needs to be converted to a ThinApp application. Go to “Application Sources>File Shares>Add” and fill in the required fields.

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border-width: 0px;" title="ThinApp-Factory2" src="https://svenhuisman.com/wp-content/uploads/2011/09/ThinApp-Factory2_thumb.png" border="0" alt="ThinApp-Factory2" width="585" height="359" />](https://svenhuisman.com/wp-content/uploads/2011/09/ThinApp-Factory2.png)

You can select “OK to scan” so ThinApp Factory will scan the directory at a given interval to check if there are new applications to convert. If you select “OK to convert” applications will also automatically be converted.

If you not want applications automatically be converted, you will need to initiate this process. Go to “Applications>All Applications”.

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border-width: 0px;" title="ThinApp-Factory3" src="https://svenhuisman.com/wp-content/uploads/2011/09/ThinApp-Factory3_thumb.png" border="0" alt="ThinApp-Factory3" width="589" height="214" />](https://svenhuisman.com/wp-content/uploads/2011/09/ThinApp-Factory3.png)

You can now select the applications you want to convert. This can be done automatically (depending on the source file, for now it needs to be an unattended MSI build) or a manual capture can be started (which I will show later on).

You can also add Feeds as application sources:

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border-width: 0px;" title="ThinAppfactory4" src="https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory4_thumb.png" border="0" alt="ThinAppfactory4" width="587" height="235" />](https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory4.png)

A feed consists of one or more applications. Every application in a feed is defined by a combination of “name”, “version”, “locale” and “installerrevision”. When a new version of an application is made available via a feed, ThinApp Factory can automatically download the application and convert it into a ThinApp package without any user intervention.

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border-width: 0px;" title="ThinAppfactory5" src="https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory5_thumb.png" border="0" alt="ThinAppfactory5" width="589" height="177" />](https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory5.png)

Now back to the conversion. Here I select “Notepad++” to be converted and as you can see the source is from a feed.

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border-width: 0px;" title="ThinAppfactory6" src="https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory6_thumb.png" border="0" alt="ThinAppfactory6" width="589" height="216" />](https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory6.png)

Then click on “Build Selected…”

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border-width: 0px;" title="ThinAppfactory7" src="https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory7_thumb.png" border="0" alt="ThinAppfactory7" width="590" height="333" />](https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory7.png)

Here you can specify which Work pool (which virtual machine to use) when capturing the application. I can imagine you sometimes need to package on Windows XP and sometimes on Windows 7. You can also choose what default settings your project should have (for example: different package.ini settings).

After selecting “OK” you can see the converting progress under “Tasks”:

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border-width: 0px;" title="ThinAppfactory9" src="https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory9_thumb.png" border="0" alt="ThinAppfactory9" width="589" height="272" />](https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory9.png)

In the background a capture VM is started and the ThinApp capture is started with a command script. After the capture is completed, ThinApp Factory will remove the snapshot of the VM, so the capture virtual machine is at a clean state when the next conversion takes place.

When the conversion is ready, the ThinApp application is placed under “Staged Builds:

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border-width: 0px;" title="ThinAppfactory10" src="https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory10_thumb.png" border="0" alt="ThinAppfactory10" width="588" height="298" />](https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory10.png)

You can select the application and click on “Publish”.

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border-width: 0px;" title="ThinAppfactory11" src="https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory11_thumb.png" border="0" alt="ThinAppfactory11" width="588" height="309" />](https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory11.png)

The Application is now available in the ThinApp Store (which is part of the ThinApp Factory appliance).

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border-width: 0px;" title="ThinAppfactory12" src="https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory12_thumb.png" border="0" alt="ThinAppfactory12" width="587" height="133" />](https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory12.png)

Select the application and click on “Get Applications”

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border-width: 0px;" title="ThinAppfactory13" src="https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory13_thumb.png" border="0" alt="ThinAppfactory13" width="225" height="73" />](https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory13.png)

The application is now downloaded to the client.

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border-width: 0px;" title="ThinAppfactory14" src="https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory14_thumb.png" border="0" alt="ThinAppfactory14" width="357" height="185" />](https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory14.png)

What if I want to customize the automatically converted application? That’s also possible with ThinApp Factory. Go to Staged or published applications, select the application and click on “Edit”. You can edit all the settings of the ThinApp application, like the package.ini:

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border-width: 0px;" title="ThinAppfactory15" src="https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory15_thumb.png" border="0" alt="ThinAppfactory15" width="587" height="303" />](https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory15.png)

Or the registry through a GUI (finally!):

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border: 0px;" title="ThinAppfactory16" src="https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory16_thumb.png" border="0" alt="ThinAppfactory16" width="587" height="305" />](https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory16.png)

If you edit a package the application needs to be rebuilded. A rebuild does not require to start a virtual machine, this is done by the ThinApp Factory appliance.

As I mentioned, you can also manually capture an application. After you imported an application you can select it and click on “Manual capture…”. A nice interface pops up describing all the steps needed to be taken: Preparing, Customize VM, Pre-capturing, Install, Finishing.

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border: 0px;" title="ThinAppfactory17" src="https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory17_thumb.png" border="0" alt="ThinAppfactory17" width="588" height="301" />](https://svenhuisman.com/wp-content/uploads/2011/09/ThinAppfactory17.png)

The idea is that ThinApp Factory will be the management console for all your ThinApps. Both automatically converted and manually captured ThinApp applications centrally stored and publsihed.

So now you have seen the ThinApp Factory and the ThinApp Store. So what’s next? ThinApp Factory is going to be integrated with Horizon App Manager eventually. What potentially also is possible that users can upload applications (or a feed) to the ThinApp Factory so that the application will be converted to a ThinApp and published to the user through the ThinApp Store or Horizon App Manager. Then you will have user installed applications (think about stateless VDI).

By the way, the information published in this blogpost was not NDA information. I checked with VMware and it was OK to publish information that was presented or available in the labs.