---
id: 2294
title: Free tools for VMware View
date: 2012-03-22T10:30:04+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=2294
permalink: /2012/03/free-tools-for-vmware-view/
categories:
  - Virtual Desktop
tags:
  - Free
  - Load Balancer
  - sizing
  - tools
  - Troubleshooting
  - VMware View
---
In these days of recession I thought it would be a good idea to sum up a couple of free tools which you can use designing, implementing and maintaining a VMware View Infrastructure. I’ve divided the tools in the following categories:

  * Assessment
  * Sizing
  * Load balancing
  * Optimizing
  * User Environment Management
  * Customization
  * Client
  * Monitoring
  * Troubleshooting

I would love to hear if you know of any free tools which can be used in or for  a VMware View Infrastructure.

<!--more-->

**<span style="text-decoration: underline;">Assessment</span>**

Before you even begin to design a VMware View environment, you need to determine what kind of workload your users are going to produce on your VMware View infrastructure. Quest has a free tool available to assess your current environment or your VDI pilot environment: <a href="http://www.quest.com/landing/?id=5515" target="_blank">the Quest VDI assessment</a>. This is a free version of Liquidware Labs Stratusphere with a couple of side notes:

  * This product is freeware and is not supported by Quest Software technical support. Community support is available on the [community page](http://communities.quest.com/community/vworkspace/assessment)
  * The download includes a key that is valid for 5 days. To continue using the tool after the key expires, you must contact your Quest Software account representative for a new key to preserve your data.
  * Supports unlimited users (may require multiple appliances)
  * No restrictions on functionality

 ****

**<span style="text-decoration: underline;">Sizing</span>**

Sizing a VDI environment is one of the most important parts of a VDI infrastructure design. Especially when you don’t know exactly the workload and the type of users (therefore you first need to assess!). <a href="http://myvirtualcloud.net/" target="_blank">Andre Leibovici</a> has created a <a href="http://myvirtualcloud.net/?page_id=1076" target="_blank">VDI flash calculator</a> which you can use to estimate a sizing for your VMware View environment. You can use this calculator to get an idea of what you might need for your VMware View infrastructure. There are no guarantees of the results of the calculations. Calculations are based on best practices and the author’s own  field experience deploying dozens of VDI solutions.

**<span style="text-decoration: underline;">Load balancers</span>**

Last month I wrote an article on how to use <a href="https://svenhuisman.com/2012/02/free-load-balancing-for-vmware-view-with-citrix-netscaler-vpx-express/" target="_blank">Netscaler VPX Express to load balance VMware View</a>. Netscaler VPX Express is a free virtual appliance from Citrix which can be used to do a lot of network related stuff, load balancing is just one of the features. I’ve been looking for free load balancer appliances for a while, but I couldn&#8217;t find an alternative to this one. If you have, let me know.

**<span style="text-decoration: underline;">Optimizing</span>**

Optimizing your desktop golden image makes a lot of sense. The impact can be huge if you look at the impact on user density (more users on a physical host) and the impact on IOPS (less reads and writes). <a href="http://www.projectvrc.com/" target="_blank">Project Virtual Reality Check</a> published a whitepaper (phase III) on this topic. Optimizing is easy when you use the free tool from Quest: [Quest Desktop Optimizer](http://communities.quest.com/community/vworkspace/blog/2011/09/08/introducing-the-free-quest-vworkspace-desktop-optimizer) which includes 40 optimizations to tweak your golden image.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border-width: 0px;" title="QuestOptimize" src="https://svenhuisman.com/wp-content/uploads/2012/03/QuestOptimize_thumb.png" border="0" alt="QuestOptimize" width="401" height="249" />](https://svenhuisman.com/wp-content/uploads/2012/03/QuestOptimize.png)

**<span style="text-decoration: underline;">User Environment management</span>** 

Managing the user environment can be complex without the right tools. Especially when most of your users are in a floating/stateless/non-persistent desktop pool. There are a couple of good solutions out there which can help you create the user’s workspaces, like RES Workspace Manager, Appsense Environment Manager or Liquidware Labs Profile Unity. RES Software however, has a free version of their flagship product RES Workspace Manager: <a href="http://www.ressoftware.com/products/wm-express" target="_blank">RES Workspace Manager Express</a>. This allows you to create a workspace by managing a user’s personalization, data and settings separate from the underlying hardware, delivery platform and operating system.

  * **Simplified Management:** Express introduces centralized user workspaces and empowers IT to eliminate login scripts and simplify the complexity of managing users. It empowers administrators to make changes predictable through an easy-to-use console.
  * **Context Aware Desktops:** Administrators can begin to provision basic resources such as printers, drives and application settings, so they follow users and adapt as their context changes.
  * **Enhance the User Experience:** Express decreases the time to deliver desktop services, introduces user state  management, and improves the automation of existing desktop management infrastructures.

**<span style="text-decoration: underline;">Customization</span>**

There is not a lot to customize about VMware View components. Techstur offers a free tool called <a href="http://www.techstur.com/Solutions/VMWare/Tech.aspx#" target="_blank">VMware View Portal eXtender</a>. This tool allows you to install and add a Content Management System (CMS) for branding and adding functionality to the VMware View Portal. The VMware View Portal eXtender gives you control over the colors, images and content specific to your company’s branding.

<img src="http://www.techstur.com/images/vm_screens.png" alt="" width="373" height="274" /> 

The eXtender also adds key functionality to the VMware View Portal with custom features such as Announcements, Links, Support Information and more.

**<span style="text-decoration: underline;">Client</span>**

Chuck Hirstius described how you can create a <a href="http://mindfluxinc.net/?p=286" target="_blank">VMware View Live CD with SUSE Studio</a>. The VMware View Client for Linux can be extracted from the Ubuntu software center and installed on a Suse Live CD. This way, repurposed desktops can be booted from a live CD which automatically starts the VMware View client.

**<span style="text-decoration: underline;">Monitoring</span>**

Unfortunately I haven’t found a free monitoring tool for a VDI infrastructure or for a VMware View environment. I did find a free monitoring tool for a vSphere infrastructure. Using <a href="http://www.vpanorama.com/" target="_blank">vPanorama</a> you will at least have a dashboard which will tell the health and performance of your VMware, storage and network. You can use the tool for free up to 250 virtual machines.

**<span style="text-decoration: underline;">Troubleshooting</span>**

There are a couple of areas where you can troubleshoot VMware View components. One of the most difficult areas to troubleshoot is the PCoIP protocol. Everything is being logged in logfiles but they can be hard to read. Fortunately, Chuck Hirstius created the <a href="http://mindfluxinc.net/?p=195" target="_blank">PCoIP logviewer</a>. An excellent tool to troubleshoot PCoIP connections. Simon Long was kind enough to <a href="http://www.simonlong.co.uk/blog/pcoip-troubleshooting/" target="_blank">explain how to use this tool</a>.

A lot of great free tools to use with your VMware View environment. Which one is YOUR favorite tool?

[poll id=&#8221;4&#8243;]