---
id: 591
title: VMware ESX 3.5 and thinprovisioning
date: 2008-12-05T12:40:41+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=591
permalink: /2008/12/vmware-esx-35-and-thinprovisioning/
categories:
  - Virtual Infrastructure
tags:
  - ESX
  - ESX 4.0
  - Service console
  - thinprovisioned disk
  - thinprovisioning
  - VMware
---
Thinprovisioning will be a new feature of the next release of ESX. However, it is already possible to use thinprovisioning from the service console with the vmkfstools command. Here are some tips (thanks to <a title="run-virtual" href="https://www.run-virtual.com/?p=223" target="_blank">Richard Garsthagen</a>):

Create a 15GB thinprovisioned disk:

<span style="font-family: Courier New;">vmkfstools -c 15G -d thin /vmfs/volumes/vmfs_volume/VM_name/thin_disk.vmdk</span>

If you want to convert a thick disk, you can create a copy from it as thin disk. After that, you will need to remove the old disk from the VM and add the new converted copy.<!--more-->

Copy an existing virtual disk to thin provisioned disk:

`vmkfstools -i /vmfs/volumes/vmfs_volume/VM_name/large_disk.vmdk -d thin /vmfs/volumes/vmfs_volume/VM_name/new_thin_disk.vmdk`

I have tried this with a template-VM, and it works. However, when I take a look at the filesize from the service console I don&#8217;t see the actual size of the file:

<p style="TEXT-ALIGN: center">
  <a href="https://svenhuisman.com/wp-content/uploads/2008/12/thincmd.jpg"><img class="aligncenter size-medium wp-image-592" title="thincmd" src="https://svenhuisman.com/wp-content/uploads/2008/12/thincmd-299x49.jpg" alt="" width="299" height="49" /></a>
</p>

When I browse the datastore, I can see the real size of the disks:

<p style="TEXT-ALIGN: center">
  <a href="https://svenhuisman.com/wp-content/uploads/2008/12/thindatastor.jpg"><img class="size-medium wp-image-593  aligncenter" title="thindatastor" src="https://svenhuisman.com/wp-content/uploads/2008/12/thindatastor-300x75.jpg" alt="" width="300" height="75" /></a>
</p>

This 15GB disk is thinprovisioned only 3 GB. When I tried to move the template to another VMFS-volume with only 13GB space left, I got the following error:

<p style="TEXT-ALIGN: center">
  <a href="https://svenhuisman.com/wp-content/uploads/2008/12/thinerror.jpg"><img class="size-medium wp-image-594  aligncenter" title="thinerror" src="https://svenhuisman.com/wp-content/uploads/2008/12/thinerror.jpg" alt="" width="294" height="119" /></a>
</p>

<p style="TEXT-ALIGN: left">
  Apparently, when you move a VM with a thinprovisioned disk from vCenter server, it converts to a thick-disk. This is because thinprovisioned disks is not integrated with vCenter server yet.
</p>

<p style="TEXT-ALIGN: left">
  Also, when you deploy from a template with a thinprovisioned disk, the new VM will get a thick-disk.
</p>

<p style="TEXT-ALIGN: left">
  Be very careful with using thinprovisioned disks. This can cause your VMFS-volume to get out of space, it&#8217;s like running a VM with a snapshot on. In the next version of ESX, there will be an alerting mechanism available that will alert the administrator when you run out of diskspace because of growing thinprovisioned disks. I don&#8217;t know if the use of thinprovisioned disk in ESX 3.5 is supported or experimental by VMware.
</p>