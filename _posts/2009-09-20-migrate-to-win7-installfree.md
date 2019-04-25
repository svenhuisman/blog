---
id: 1430
title: Migrate to Windows 7 with InstallFree
date: 2009-09-20T21:55:35+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=1430
permalink: /2009/09/migrate-to-win7-installfree/
categories:
  - Virtual Applications
tags:
  - Application Virtualization
  - Installfree
  - VMworld
  - Windows 7
---
At VMworld 2009 in San Francisco I visited the <a title="InstallFree" href="http://www.installfree.com" target="_blank">InstallFree</a> booth. And while I was there, the guys from InstallFree showed me this concept of the universal client, where you package/virtualize your applications once and run those applications on XP, Vista, Windows 2008 and Windows 7. &#8220;Is this so special?&#8221; I thought to myself. Well, actually it is. Where some of the vendors will make it sound very easy to migrate to a new OS when using their application virtualization solution, in fact it isn&#8217;t. Sure, in some cases you don&#8217;t need to repackage your applications, but at least you have to certify if the package still works on the new OS. <!--more-->Most of the times the virtualized applications still have dependencies on the OS. For example when virtualizing an application which requires .NET framework you can decide to include it in the package or install .NET framework in the base image of your packaging station (and on all the clients of course). When choosing the second option, your virtualized application is depended on the OS. This is an easy example, but in many cases the dependency on DLL&#8217;s or other files on the local OS isn&#8217;t that obvious.

I shot a video of the guys of InstallFree because I thought it was good stuff for a blogpost, but actually it&#8217;s just the beginning of a new investigation. In an upcoming article I will blog about how to migrate to Windows 7 for all the application virtualization products from our <a title="comparison chart" href="https://svenhuisman.com/2009/09/application-virtualization-comparison-chart-september-2009/" target="_blank">comparison chart</a>. In the mean time, you can check the video from InstallFree about the universal client concept.



[InstallFree demonstration](http://vimeo.com/6390296) from [Virtualfuture.info](http://vimeo.com/user1034135) on [Vimeo](http://vimeo.com).