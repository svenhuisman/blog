---
id: 213
title: 4sysops and the disadvantages of application virtualization
date: 2008-08-04T16:18:59+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=213
permalink: /2008/08/4sysops-and-the-disadvantages-of-application-virtualization/
categories:
  - Virtualization news
tags:
  - Application Virtualization
---
<a title="4sysops.com" href="http://4sysops.com/" target="_blank">4Sysops</a> is doing a good job on writing about application virtualization. The latest article is about <a title="Disadvantages application virtualization" href="http://4sysops.com/archives/the-disadvantages-of-application-virtualization/" target="_blank">disadvantages</a> of application virtualization (after writing about the <a title="Advantages application virtualization" href="http://4sysops.com/archives/the-advantages-of-application-virtualization/" target="_blank">advantages</a>). It depends on what product you use for virtualizing your applications, but I have to disagree on some points he mentions:<!--more-->

**Shell Integration is hard**: There are products available now (and more will follow) that delivers shell integration out of the box, like <a title="Installfree" href="http://www.installfree.com" target="_blank">Installfree</a>. It&#8217;s just a mather of time other vendors will have this feature as well.

**More work for administrators**: Yes, initially administrators will have to learn how to virtualize their applications, but in the end, they will save a lot of time. Think about migrating to a new platform, or updating applications. It will be done with a click of a mouse-button (well, kind of&#8230; 😉 )

**Changes to the infrastructure**: With a product like <a title="ThinApp" href="http://www.vmware.com/products/thinapp/" target="_blank">ThinApp</a>, you don&#8217;t have to adjust your current Infrastructure, you just plug it in (says VMware, so it must be true).

**Single point of failure**: I don&#8217;t see why application virtualization can be a single point of failure (again, depending on the product). Applications can be streamed to the desktop for offline usage, or you can create a high available backend. When applications are streamed, you still have the benefits of application virtualization, because the applications will still be isolated and still be updated automatically when connected to the datacenter.

**Costs**: OK, you pay the price for licencing the application virtualization product. You will then have to calculate how much time you are going to spend less on managing you applications. I think you can create a pretty solid business case.

Only 4 disadvantages left, but I think the list with disadvantages is short enough 😉