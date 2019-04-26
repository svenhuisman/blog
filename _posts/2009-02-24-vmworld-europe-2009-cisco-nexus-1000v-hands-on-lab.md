---
id: 897
title: 'VMworld Europe 2009: Cisco Nexus 1000V Hands-on lab'
date: 2009-02-24T13:21:50+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=897
permalink: /2009/02/vmworld-europe-2009-cisco-nexus-1000v-hands-on-lab/
categories:
  - Virtual Infrastructure
  - VMworld 2009 Cannes
tags:
  - Cannes
  - Cisco
  - Nexus 1000V
  - VMware
  - VMworld Europe 2009
---
Today I attended the self-paced Cisco Nexus 1000V hands-on lab. The Nexus 1000V is a Distributed Virtual Switch, available for the upcoming next version of ESX(i).

> _The Nexus 1000V switch is a pure software implementation of a Cisco Nexus switch. It resides on a server and integrates with the hypervisor to deliver VN-Link virtual machine-aware network services._

Basically, you have 2 parts: 1 that runs on each host (Virtual Ethernet Module) and 1 virtual appliance that runs the supervisor (Virtual Supervisor Module).<!--more-->

<span style="text-decoration: underline;"><strong>Virtual Ethernet Module (VEM)</strong></span>: Software inside the ESX or ESXi host which enables the host to join a Cisco Nexus distributed Virtual Switch

<span style="text-decoration: underline;"><strong>Virtual Supervisor Module (VSM)</strong></span>: Instance of the Nexus 1000V Distributed Virtual Switch that controls and manages the overall operation

I asked if I could see on which host the VSM is running and whether it has a high availability option. The VSM is not a single point of failure. The VEM on each host will take care that the Distributed Virtual Switch will continu to work. The VSM is more for configuration and managing the Nexus 1000V. This can be done by a remote CLI. Actually, the vSphere Client will present a view-only distributed vSwitch, so the VI-admin cannot configure the switch. The only thing a VI-admin can do is set some alarms, and attach a VM to a portgroup (which a &#8220;real&#8221; network-admin must configure).

Besides that, you can configure Mobile VM security, network policy and policy based virtual machine connectivity.

I asked if I could make some pictures, but the Cisco guy said no while the VMware guy said yes. Afterwards, it turned out I was allowed to make pictures. <a title="Boche.net" href="https://boche.net/blog/" target="_blank">Jason boche</a> took some, so he will probably post them shortly on his blog.

I&#8217;m no network-guy, so I think this is a good step to bring the management of the (virtual) network back to were it belongs.

More info about the <a title="Cisco Nexus 1000V" href="https://www.cisco.com/en/US/products/ps9902/index.html" target="_blank">Cisco Nexus 1000V</a>.