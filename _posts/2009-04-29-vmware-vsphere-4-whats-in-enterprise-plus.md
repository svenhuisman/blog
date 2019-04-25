---
id: 1117
title: 'VMware vSphere 4: What&#8217;s in Enterprise Plus?'
date: 2009-04-29T09:57:29+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=1117
permalink: /2009/04/vmware-vsphere-4-whats-in-enterprise-plus/
categories:
  - Virtual Infrastructure
tags:
  - Enterprise
  - ESX 4
  - VMware
  - vSphere
  - vSphere 4
---
When you look at all marketing material of <a title="VMware vSphere" href="https://www.vmware.com/products/vsphere/index.html" target="_blank">VMware vSphere</a>, you can get confused about what feature is in what version. For example: I was under the impression that 8-way Virtual SMP was a new feature of vSphere regardless of what version you have (Standard, Advanced, Enterprise or Enterprise Plus). Take a look at <a title="vSphere Press-release" href="https://vmware.com/company/news/releases/perfo-vsphere-launch.html" target="_blank">this press-release</a> for example:

> _VMware vSphere 4 also introduces new scalability capabilities.  By expanding server resource support to 1 TB of RAM and 64 logical processing cores, some of the very largest and most powerful servers can be leveraged for virtual workloads.  With support for up to 256 GB of RAM and eight virtual CPUs per virtual machine, nearly 100 percent of resource-intensive workloads such as high-end databases are suitable for virtualization._

When you look at the <a title="vSphere pricing" href="https://www.vmware.com/files/pdf/vsphere_pricing.pdf" target="_blank">pricing sheet</a>, there is no reason to believe that  8-way Virtual SMP is not in all versions of vSphere 4.<!--more-->

<p style="text-align: center;">
  <a href="https://svenhuisman.com/wp-content/uploads/2009/04/enterpriseplus.jpg"><img class="aligncenter size-full wp-image-1118" title="enterpriseplus" src="https://svenhuisman.com/wp-content/uploads/2009/04/enterpriseplus.jpg" alt="enterpriseplus" width="435" height="376" srcset="https://svenhuisman.com/wp-content/uploads/2009/04/enterpriseplus.jpg 725w, https://svenhuisman.com/wp-content/uploads/2009/04/enterpriseplus-350x302.jpg 350w, https://svenhuisman.com/wp-content/uploads/2009/04/enterpriseplus-650x561.jpg 650w" sizes="(max-width: 435px) 100vw, 435px" /></a>
</p>

 The orange square in the upper right container only contains:

  * Third-party Multipathing
  * Distributed Switch
  * Host Configuration Controls

But when you take a closer look at <a title="VMware vSphere key features" href="https://www.vmware.com/files/pdf/key_features_vsphere.pdf" target="_blank">key feature list</a> of all the versions, these are the features of Enterprise Plus which are not in the other versions:

  * **8-way Virtual SMP™.** Enable a single virtual machine to simultaneously use up to 8 logical processors on your server (increased from 4 for VMware ESX/ESXi 3). With 8-way Virtual SMP even the most processor intensive software applications like databases and messaging servers can be virtualized.
  * **vStorage APIs for Multipathing**. Support for 3rd party multipathing plug-ins such as EMC Powerpath to ensure high availability and load balancing for critical applications.
  * **Host Profiles.** Establish standard configurations for VMware ESX/ESXi hosts and automate compliance to these configurations, simplifying operational management of large scale environments and reducing errors due to misconfigurations.
  * **Resource pool access control and delegation**. Secure resource allocation at different levels in the company. For example, when a top-level administrator makes a resource pool available to a department-level use, all virtual machine creation and management can be performed by the department administrator within the boundaries assigned to the resource pool.
  * **vNetwork Distributed Switch**: Aggregate virtual networking across many ESX hosts and even clusters. These are all capabilities of the vNetwork Distributed Switch: 
      * **Centralized virtual network management**. Simplify provisioning and administration of virtual networking through a centralized interface. Create and manage a single distributed switch with distributed virtual port groups than span a Datacenter wide array of ESX/ESXi hosts.
      * **Support for Private VLANs**. Simplified setup and monitoring of Private VLANs, segmenting network traffic easily in shared environments
      * **Network VMotion**. Retain network runtime state centrally as virtual machines live migrate from server to server in shared DRS clusters; simplifying network troubleshooting and monitoring.
      * **Bidirectional Network Traffic Shaper**. Enhance virtual machine traffic prioritization and management through bidirectional rate limiting
      * **Third Party Distributed Virtual Switches**. Enable monitoring and control of your virtual networking environments through the familiar interfaces of third party networking tools, with the capability to plug in third party software virtual switches such as the Cisco Nexus 1000V. (note: third party virtual switches are purchased separately.)

When you now have a VI3 Enterprise license, you get a vSphere 4 Enterprise license, so no Enterprise Plus features. Fortunately, you are able to upgrade your Enterprise licenses to Enterprise Plus for a reduced price until December 15th:

> _**VMware Infrastructure 3 Enterprise to VMware vSphere 4 Enterprise Plus:** At less than 50% of the upgrade list price, customers can add key features such as dynamic resource allocation, power management, live migration, the distributed switch, and host configuration controls. Suggested US list price: $295 per processor_
> 
> _Note: VMware vSphere upgrade promotions will be available for sale on May 21, 2009. Special promotion pricing ends on December 15, 2009._