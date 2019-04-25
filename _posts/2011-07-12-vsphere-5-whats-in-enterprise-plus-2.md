---
id: 2074
title: 'vSphere 5: What&#8217;s in Enterprise Plus?'
date: 2011-07-12T20:21:22+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=2074
permalink: /2011/07/vsphere-5-whats-in-enterprise-plus-2/
image: /wp-content/uploads/2011/07/cloud-computing.jpg
categories:
  - Virtual Infrastructure
tags:
  - Enterprise
  - License
  - VMware
  - vRAM
  - vSphere 5
---
One of the most popular posts on <a href="https://svenhuisman.com" target="_blank">VirtualFuture.info</a> is about licensing vSphere 4 and the difference <a href="https://svenhuisman.com/2009/04/vmware-vsphere-4-whats-in-enterprise-plus/" target="_blank">vSphere 4 Enterprise and Enterprise Plus</a>. Apparently, the information is hard to find or not simply explained somewhere. Now that <a title="vSphere 5 editions" href="https://www.vmware.com/products/vsphere/buy/editions_comparison.html" target="_blank">vSphere 5</a> is announced, I might as well blog about this version as well.

First of all, the limit on the number of cores are gone. With vSphere 4 Enterprise you were limited to 6 cores per CPU socket. With Enterprise Plus, this limit was 12 cores per CPU socket. The new vSphere licensing model eliminates the restrictive physical entitlements of CPU cores and physical RAM per server, replacing them with a single virtualization-based entitlement of pooled virtual memory (vRAM). This will simplify the process of purchasing deploying and managing vSphere while facilitating the move to shared infrastructure as a service. The vSphere 5.0 licensing model is per processor (CPU) with pooled vRAM entitlements.

The vRAM licenses come in a number of flavors:

<!--more-->

  * 32GB vRAM for Essentials Kit
  * 32GB vRAM for Essentials Plus Kit
  * 32GB vRAM for Standard
  * 64GB vRAM for Enterprise
  * 96GB vRAM for Enterprise Plus

What does this mean? An example:

When you have 2 hosts in a cluster, and each host has 2 CPU sockets, and you want to use vSphere Enterprise. You would need 4 CPU licenses. This gives you 4*64GB = 256GB vRAM that the VM’s can use on the cluster. If you need more memory for your VM’s, you have to add licenses, or upgrade to Enterprise Plus.

**Features**

The following features are available per version:

**vSphere 5 Standard**:

  * ESXi
  * VC Agent
  * 8-Way vSMP
  * Update Manager
  * VMFS
  * vStorage APIs for
  * Data Protection
  * High Availability (HA)
  * Thin Provisioning
  * Data Recovery
  * vMotion

**vSphere 5 Enterprise** includes all the features of vSphere 5 Standard and:

  * Hot Add
  * Fault Tolerance
  * vShield Zones
  * Storage vMotion
  * DRS
  * DPM
  * vStorage APIs for Multipathing
  * Virtual Serial Port Concentrator
  * vStorage APIs for Array Integration

**vSphere 5 Enterprise Plus** includes all the features of vSphere 5 Enterprise and:

  * 32-Way vSMP
  * Distributed Switch
  * Host Profiles
  * Network I/O Control
  * Storage I/O Control
  * Profile-Driven Storage
  * Storage DRS
  * Auto Deploy
  * View Accelerator

**Upgrade paths**

The following upgrade paths are available:

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border: 0px;" title="upgradevsphere" src="https://svenhuisman.com/wp-content/uploads/2011/07/upgradevsphere_thumb.png" border="0" alt="upgradevsphere" width="244" height="220" />](https://svenhuisman.com/wp-content/uploads/2011/07/upgradevsphere.png)

This means, when you currently have vSphere 4 Advanced licenses with active support you are able to upgrade those licenses to vSphere 5 Enterprise.