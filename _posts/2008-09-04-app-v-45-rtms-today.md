---
id: 287
title: App-V 4.5 RTMs today!
date: 2008-09-04T16:35:25+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=287
permalink: /2008/09/app-v-45-rtms-today/
categories:
  - Virtualization news
tags:
  - App-V
---
Microsoft <a title="App-V 4.5 RTM" href="https://blogs.technet.com/softgrid/default.aspx" target="_blank">RTMs App-V today</a>. With App-V 4.5 a lot of new features are introduced. One of them is Dynamic Suite Composition (DSC), which is just a fancy term for application interconnectivity:

> _we have introduced a feature called Dynamic Suite Composition (DSC) that is targeted at solving the plug-in and middleware issues specifically. This feature allows an administrator to dynamically suite different plug-in and middleware application packages together with a primary application so that the applications can interact with each other, while maintaining only a single package for each application and reducing total package sizes._

Another new feature is streaming over HTTP(S). I also thought there would be a possibility to create standalone packages (like you can with ThinApp), but this is not the case. You can create MSI-packages and put them on CD:

> _The publishing and delivery of applications through a standalone MSI-based installer, which can be delivered offline via a CD/DVD or deployed via an existing software distribution mechanism that the customer currently has deployed._

Our application comparison chart will be updated very soon. Actually, we will have an updated version ready by next week, right after Citrix releases the new XenApp.