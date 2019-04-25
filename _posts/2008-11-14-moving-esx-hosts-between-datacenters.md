---
id: 567
title: Moving ESX hosts between Datacenters
date: 2008-11-14T10:29:14+02:00
author: Johan
layout: post
guid: https://svenhuisman.com/?p=567
permalink: /2008/11/moving-esx-hosts-between-datacenters/
categories:
  - Virtual Infrastructure
tags:
  - Datacenter
  - ESX
  - VMware
---
Normally when multiple datacenters are created in Virtual Center it is because they located at different sites aka physical datacenters. In this case the administrator created a datacenter that spanned multiple physical locations, which isn&#8217;t a good idea.

That&#8217;s why he created a new datacenter and cluster at his own location for the hosts at that site, VMotioned all running VM&#8217;s to other hosts and set the host in maintenance mode, believing that he could VMotion the running VM&#8217;s to the new datacenter. Well it went a bit different than he thought: although Virtual Center wasn&#8217;t happy VMotioning the VM&#8217;s to the new datacenter (it gave a clear warning that in the new datacenter vSwitches might be missing) it gave an OK, but when the Finish button was clicked it failed all together stating that VMotioning between datacenters isn&#8217;t allowed. 

Ok this is what he eventually did: he disconnected the host from the original Datacenter\Cluster with all VM&#8217;s still running on that host and reconnected that host to the new Datacenter\Cluster. I must admit it was pretty bold to do but it all worked because no ip-addresses/names etc were altered in this process. Whether it is a supported method I really can&#8217;t say, the only thing I know it worked for him.

In my opinion it is better to have good design and stick to it because good designs are ment to be flexible, easy to maintain and easy to expand.