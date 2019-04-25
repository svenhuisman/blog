---
id: 1278
title: Why vCenter server should be free
date: 2009-07-23T20:43:52+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=1278
permalink: /2009/07/why-vcenter-server-should-be-free/
categories:
  - Virtual Infrastructure
tags:
  - ESX
  - esxi
  - Hyper-V
  - vCenter
  - VMware
  - VMworld
  - vSphere
---
Do you remember the days when VMware P2V Assistant costs $20.000? And a couple of years ago, the product was suddenly available for free? And what about the introduction of the free ESXi? VMware&#8217;s hypervisor available for free all of a sudden? Well, this is exactly what I think will happen to vCenter Server. It&#8217;s just a matter of time, but VMworld 2009 is getting close, so why wait, VMware? 😉<!--more-->

First of all, what&#8217;s really in vCenter server? According to VMware:

> <div class="col">
>   <em>VMware vCenter Server provides a scalable and extensible platform that forms the foundation for virtualization management. VMware vCenter Server centrally manages VMware vSphere environments allowing IT administrators dramatically improved control over the virtual environment compared to other management platforms.</em>
> </div>

<div class="col">
  Basically what it comes down to: 1 place to manage your ESX servers and the tool to enable/configure the features of ESX, like VMotion, DRS, HA, FT, etc.
</div>

Now the reasons why I think vCenter server should be free:

1. If I look at the licensing of ESX, all the features are already in those licenses. If I buy a couple of ESX Enterprise Plus licenses, all the fancy features like VMotion, DRS, FT, Distributed vSwitches, Host profiles, etc are paid for. So why do I have to pay an extra 4000 euro (excluding mandatory support) just to enable those features?

2. When you buy an acceleration kit, which include 6 or 8 CPU licenses of ESX Enterprise Plus + a vCenter server license, you actually save the costs of a vCenter server license + some more. If you look at it this way, vCenter server is already free!

3. Giving vCenter server away for free can give VMware an exta impulse to sell vCenter related products, like vCenter Chargeback, vCenter Appspeed, vCenter Labmanager, vCenter etc, etc&#8230;

4. vCenter server can&#8217;t manage the free version of ESXi. Although it&#8217;s the same version as the &#8220;regular&#8221; ESXi version, you need a vCenter agent license to manage an ESX(i) server, which is not included in the free version. So VMware shouldn&#8217;t be affraid that companies will only use the free ESXi and the free vCenter server. On the other hand, making the vCenter agent also available for free could also grow the install-base of VMware. Eventually, these customers will buy ESX licenses to enable more features.

5. Decisions about which virtualization vendor to choose aren&#8217;t always made by the people who need to work with the product. In the current financial situation, these decisions are made by people who are financial responsible for the organization. Simply put: if the CFO looks at the price list and  the listed features and he sees on one hand Citrix Xenserver, that is free and include Xencenter and High Availability and no downtime during maintenance because of Xenmotion, and on the other hand he sees VMware that has similar features but with a very big price-tag, his decision is easily made. But vCenter server at no costs looks pretty good to the same CFO.

6. When Microsoft entered the &#8220;hypervisor&#8221;-scene, everybody was laughing. &#8220;Hyper-V is no competition to VMware  and is at least 2-3 years behind VMware&#8221;. Well, with Hyper-V server R2 coming soon and a very good marketing-team, VMware could loose more and more deals to Microsoft. Not that Hyper-V R2 suddenly is a great product, but &#8221; it will do&#8221; for a lot of companies entering the virtualization market. It&#8217;s free, it has a Windows interface which most of the administrators are familiar with and it also comes with Windows 2008 R2, you just have to enable a role. To counter the Microsoft attack, making vCenter server available for free could give an extra impulse.

7. What else could VMware announce during VMworld 2009? 2007 was the announcement of ESXi  <span style="text-decoration: line-through;">for  free</span> (edit: actually, the free version was not released until <a title="ESXi" href="http://www.vmware.com/company/news/releases/esxi_pricing.html" target="_blank">the end of July 2008</a>),2008 the unofficial announcement of vSphere and 2009?

7 reasons to make vCenter server free! Time will tell if I&#8217;m right. 😉