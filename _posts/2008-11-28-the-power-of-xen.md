---
id: 586
title: The Power of XEN
date: 2008-11-28T09:57:09+02:00
author: Matthijs Haverink
layout: post
guid: https://svenhuisman.com/?p=586
permalink: /2008/11/the-power-of-xen/
categories:
  - Virtual Infrastructure
tags:
  - Citrix
  - xen
  - xenserver
  - xensource
---
Last week I attended a meeting with several guys from Citrix. Purpose of the meeting was to convince us that the latest releases of Citrix XenServer are mature products for the enterprise market. Why this meeting? Because lot&#8217;s is said about Xen (the non commercial product) and XenServer (Citrix commercial product), but for now it only has a 3% marketshare. So when customers ask us for a reference it far more difficult to give a reference than for example VmWare. But back to the point, What did Citrix tell us to convince us?

<!--more-->Well they first started to tell us about the non-commercial &#8220;engine&#8221; Xensource. This is of course is an open-source project which has been developped by the community for several years now. The biggest advantage of this way of deploping is that when for example one developper of the community needs a specific feature within the hypervisor, he will (try to) develop it and upload the new version to the community, this way a lot of people are working on a lot of different features. Disadvantage is of course that not all new features are 100% stable but close to it.

As we all know Citrix has aquired Xensource a year and a half ago, and developed a commercial product around the Xensource Hypervisor. But what did Citrix do to the product to be able to fully support the hypervisor? They tested, and tested, and tested and finally removed all unstable parts are redisgned certain parts to make it run Smoothly. This way they had all advantages from the open source development community and by the alliance with Microsoft they are able to make it perform for &#8220;Microsoft Windows&#8221; vritual machines aswell. They explained us that for this matter the non-commercial product still exists. New features are developed within the community, by Citrix itself, or even by Microsoft (because they use exactly the same hypervisor) . This way they can keep up with the evolution of the competition.

So a short summary:

Advantages <a title="Xen (open source)" href="https://www.xen.org/" target="_blank">XenSource</a>:

&#8211; Quick Development

&#8211; Big Community (So even support is not that Bad)

&#8211; Almost native performance for Linux Clients

&#8211; Abbility to adjust

Additions <a title="XenServer" href="https://www.citrix.com/English/ps2/products/product.asp?contentID=683148&ntref=hp_nav_US" target="_blank">XenServer</a>

&#8211; Improved performance for Windows machines

&#8211; 100% stable product

&#8211; Full support on all features

By all means I&#8217;m convinced that XenServer is a enterprise ready product which is build on a solid piece of technology.