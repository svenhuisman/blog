---
id: 2264
title: 'VMware View Local Mode &#8211; Lessons learned'
date: 2012-01-26T23:43:26+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=2264
permalink: /2012/01/vmware-view-local-modelessons-learned/
categories:
  - Virtual Desktop
tags:
  - local mode
  - View
  - VMware
---
I’ve been working with VMware View Local Mode for couple of weeks now and I wanted to share my experience. VMware View Local Mode allows a virtual desktop to be downloaded to a laptop or desktop and to be executed locally. The CPU, memory, disk, network and graphics from the local desktop is being used to execute the virtual desktop. No remote display protocol is being used. VMware View Local mode is also part of the Client Side Desktop Virtualization (CSDV) Smackdown, a whitepaper which explains what CSDV is, when to use it and what the possibilities are. This whitepaper will be comparable to the <a href="https://virtuall.eu/download-document/vdi-smackdown" target="_blank">VDI smackdown</a>, only this time it will not be about server-hosted desktop virtualization, but client-hosted desktop virtualization. This whitepaper is expected to be released in Q1 of 2012. In this blogpost I will share my experience with VMware View Local mode, how it works and what doesn’t work.

**How it works**

The benefits of using VMware View Local Mode:

_“With View Client with Local Mode, users can check out and download a View desktop to a local system such as a laptop. Administrators can manage these local View desktops by setting policies for the frequency of backups and contact with the server, access to USB devices, and permission to check in desktops.”_

I assume you have a basic knowledge of the VMware View architecture. If not, here is a basic overview:

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border: 0px;" title="view_architect" src="https://svenhuisman.com/wp-content/uploads/2012/01/view_architect_thumb.png" border="0" alt="view_architect" width="345" height="355" />](https://svenhuisman.com/wp-content/uploads/2012/01/view_architect.png)

<!--more-->In a server-hosted scenario, a virtual desktop is remotely access by a View client. The virtual desktop runs on a VMware vSphere ESX server and the VMware View Connection server will make sure the user will connect to the right virtual desktop. In a client-hosted scenario, the View client will download (check-out) a copy of a virtual desktop and the virtual desktop will run on the clients computer. When a copy of a virtual desktop is downloaded, the original virtual desktop remains stored and registered on a VMware vSphere ESX server.This virtual desktop can not be altered and remains powered off. To be able to download a virtual desktop, a VMware View Transfer server is required. This is a VMware View connection server role which can be installed by running the VMware View Connection server setup. The ESX host on which the VMware View Transfer server is located needs to be able to access the storage on which the virtual desktops are stored.

The essence of this scenario is that the execution platform of the desktop is locally and not in the datacenter. This means you don’t need as many servers as with a server-hosted VDI scenario. Up to 512 virtual machines can be registered to a VMware ESX server, if they are not all turned on. In case of VMware View Local Mode, the virtual desktops will be turned off. Also, there is less need for high performance storage if the virtual desktops are executed locally.

**Server roles**

Not taking redundancy and remote access into consideration, you need at least a VMware vCenter server, a VMware ESX host, a VMware View Connection server and a VMware View Transfer server to use VMware View Local Mode virtual desktops. What does this Transfer server do exactly?

_“A View Transfer Server downloads system-image files, synchronizes data between local desktops and the corresponding remote desktops in the datacenter, and transfers data when users check in and check out local desktops. You install View Transfer Server in a virtual machine that runs Windows Server.”_

When you install the View Transfer server, make sure to select an LSI Logic **<span style="text-decoration: underline;">Parallel</span>** SCSI controller. You cannot install View Transfer Server on a virtual machine with a SAS or VMware paravirtual controller. The reason for this is that when performing data-transfers between the local desktop and the corresponding remote desktop in the datacenter, the virtual hard disk is mounted directly from the storage to the SCSI controller on the VMware Transfer server.

When VMware View Composer linked-clones are being used for the local-mode virtual desktops, the base image (golden image, parent VM) needs to be published to the Transfer server. A “Transfer Server repository” is required and this can be a local repository (a folder on the View Transfer server) or a remote repository (a UNC path to a shared folder on the network).

**Local Mode pool**

If you create a pool for Local Mode users, you have two choices: Automated and manual. With automated, linked-clone virtual desktops will be created and the parent image needs to be published on a VMware View Transfer server. With manual, the virtual desktops have to be manually created (or by script) first, before they can be added to a manual pool. Only dedicated assignment can be used with Local Mode, which means a user always gets the same virtual desktop.

**Policies**

My advice is to create a dedicated pool for Local Mode desktops. You don’t want users to be able to run their desktop locally and remotely. How would you size such an environment when you don’t know if users will run their desktop local or in the datacenter? Besides, if the users are able to run their desktop locally, why would they want to connect to their desktop remotely?

To create a dedicated pool for local mode desktop you have to change the policies. First, adjust the “Local Mode policies” at the global level. Set the Local Mode to “Deny”, so that virtual desktops by default can not be checked-out:

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border: 0px;" title="vielocalmodepolicy" src="https://svenhuisman.com/wp-content/uploads/2012/01/vielocalmodepolicy_thumb.png" border="0" alt="vielocalmodepolicy" width="425" height="207" />](https://svenhuisman.com/wp-content/uploads/2012/01/vielocalmodepolicy.png)

On the Local Mode pool that is created, change the View “Policy > Remote Mode” to “Deny” and the “Local Mode Policy > Local Mode” to “Allow”.

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border: 0px;" title="viewpol" src="https://svenhuisman.com/wp-content/uploads/2012/01/viewpol_thumb.png" border="0" alt="viewpol" width="531" height="171" />](https://svenhuisman.com/wp-content/uploads/2012/01/viewpol.png)

When a user wants to connect to a Local Mode desktop, he needs to download (check out) the desktop first:

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border: 0px;" title="VMwareView" src="https://svenhuisman.com/wp-content/uploads/2012/01/VMwareView_thumb.png" border="0" alt="VMwareView" width="372" height="282" />](https://svenhuisman.com/wp-content/uploads/2012/01/VMwareView.png)

Other Local Mode policies that can be set:

  * User- initiated rollback (after a rollback the local version of the desktop is discarded and the user can download the desktop on another host).
  * Max time without server contact (after this time has expired, the local desktop will suspend and can not be started).
  * Target replication frequency
  * User deferred replication (can the user suspend the replication?).
  * Disks replicated (which disks are being replicated, OS, user-data or both? Only for Composer VMs).
  * User-initiated check in (Is the user able to check-in the virtual desktop (upload to datacenter and discard the local copy)?).
  * User-initiated replication

**Lessons learned**

Besides the best practices for VMware View Local Mode desktop mentioned in the VMware View documentation, these are lessons learned:

  * Default network of the local virtual desktop is NAT (network address translation). In most cases the default settings will be the preferred one. Especially when a VPN connection is made from the host, the virtual desktop can also connect with the VPN because of the NAT-network. Unfortunately, the virtual desktop can not be remotely managed, because it can not be found from the network. The default setting can be changed to Bridged networking with a registry key on the client. With bridged networking, the virtual network adapter in the View desktop connects to the physical network adapter in the host computer. Bridged networking makes the View desktop visible to other computers on the network and requires the desktop to have its own IP address. If a VPN connection is required, this should be made from the virtual desktop, not from the host.
  * The first check out can be time consuming, especially when you are on a slow LAN. After this initial download, the next data transfers (replications) will be much smaller and also be a background task, so the user can continue to work.
  * When using linked-clones to deploy Local mode desktops, make sure not to recompose the desktops. When a recompose is performed on Local mode desktops, the entire image needs to be downloaded again. This is definitely a feature which needs improvement.
  * Log on as current user not supported with Local Mode desktops. You will have to log on to the VMware View client manually.
  * You can’t have VMware Player or Workstation installed on the same host as the VMware View client with local mode.
  * There is no Multi-monitor support with a Local mode desktop.
  * ThinApp deployment from the View Management console is not supported on View Local Mode desktops. ThinApp applications can be deployed to Local mode desktops using other methods, like Thinreg or Active Directory deployment.
  * Hardware version 8 is not supported. Make sure you create a virtual machine with virtual hardware version 7, because version 8 is default on vSphere 5.
  * Persona management is also not supported with Local mode.
  * Make sure that users are able to contact the View connection server from time to time. If they can not contact the server within the specified time, the virtual desktop will be suspended. A View Security server can be used so that if a user has an internet connection a connection server can always be contacted.
  * After a local desktop is checked out, it takes advantage of the memory and CPU capabilities of the local system, regardless of the memory and CPU settings specified for the virtual machine in vCenter Server. This means that the minimum amount of CPU and RAM needed to run the desktop can be configured on the virtual machine.

If you are involved in a VMware View Local Mode deployment, let me know. I’m interested in your experience.