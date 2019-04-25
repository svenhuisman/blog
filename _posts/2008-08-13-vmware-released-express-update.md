---
id: 244
title: VMware released express update
date: 2008-08-13T08:42:28+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=244
permalink: /2008/08/vmware-released-express-update/
categories:
  - Virtualization news
tags:
  - VMware
---
Very important to all the customers who installed ESX(i) 3.5 update 2. I just received this e-mail:

> _Dear VMware Customers,  
> We have released the express patches for the product expiration issue. Please go to_ <a href="http://www.vmware.com/go/esxexpresspatches" target="_blank"><em>http://www.vmware.com/go/esxexpresspatches</em></a> _for more information.  
> Problem:  
> An issue has been discovered by many VMware customers and partners with ESX/ESXi 3.5 Update 2 where Virtual Machines fail to power on or VMotion successfully. This problem began to occur on August 12, 2008 for customers that had upgraded to ESX 3.5 Update 2. <!--more-->The problem is caused by a build timeout that was mistakenly left enabled for the release build.
> 
>  
> The following message is displayed in the vmware.log file for the virtual machine:  
> This product has expired. Be sure that your host machine&#8217;s date and time are set correctly.  
> There is a more recent version available at the VMware web site:_ [_http://www.vmware.com/info?id=4_](http://www.vmware.com/info?id=4)_.  
> &#8212;&#8212;&#8212;&#8212;&#8211;  
> Module License Power on failed.  
> Affected Products:  
> &#8211; VMware ESX 3.5 Update 2 & ESXi 3.5 Update 2.  
> &#8211; The problem will be seen if ESX350-200806201-UG is applied to a system.  
> &#8211; No other VMware products are affected.  
> Resolution:  
> VMware Engineering has produced express patches for impacted customers to resolve the issue.  
> FAQ:  
> 1. What do the express patches do?  
> There are two express patches: one for ESX 3.5 Update 2 and one for ESXi 3.5 Update 2. They are specifically targeted for customers who have installed or fully upgraded to ESX/ESXi 3.5 Update 2 or who have applied the ESX350-200806201-UG patch to ESX/ESXi 3.5 or ESX/ESX 3.5 Update 1 hosts. For customers who haven’t done either, these express patches should not be applied.  
> To be noted is that these patches have been validated to work with esxupdate. However, testing with the VMware Update Manager is still under way. In subsequent communications, we will provide confirmation whether the patches work with VMware Update Manger or if a re-spin is required.  
> We are currently testing an option to apply the patch without requiring VMotion or VM power-off and re-power-on at the point of patch application. To immediately refresh vmx on the VM, one can VMotion off running VMs, apply the patches and VMotion the VMs back. If VMotion capability is not available, VMs can be powered off before the patches are applied and powered back on afterwards.  
> 2. When will VMware re-issue the upgrade media and patch bundles?  
> VMware plans to re-issue upgrade media by 6pm, August 13 PST and all update patch bundles later in the week. We will provide an ETA for the update patch bundles subsequently.  
> NOTE:  
> An upgrade media refers to ESX 3.5 Update 2 ISO, ESXi 3.5 Update 2 ISO, ESX 3.5 Update 2 upgrade tar and zip files. They are for customers who haven’t installed or upgraded to ESX/ESXi 3.5 Update 2 but wish to._
> 
> _The &#8220;patch bundles&#8221; here refer to those released at GA. They are for customers who do not wish to do a full upgrade to ESX/ESXi 3.5 Update 2, but apply patches that are deemed necessary to hosts running ESX/ESXi 3.5 or ESX/ESXi 3.5 Update 1. They are not the same as the express patch which is described above.  
> 3. Why does VMware plan to re-issue the upgrade media before the patch bundles?  
> Since we can complete building and testing of the upgrade media before the patch bundles, we want to make that available to customers right away instead of re-issuing all the binaries later in the week._